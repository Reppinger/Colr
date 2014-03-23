class ColorController < UIViewController
  PADDING = 10

  attr_accessor :color

  def initWithColor(color)
    initWithNibName(nil, bundle: nil)
    self.color = color
    self.edgesForExtendedLayout = UIRectEdgeNone
    self
  end

  def viewDidLoad
    super
    build_view
  end

  def build_view
    self.title = self.color.hex
    @info_container = create_info_container
    self.view.addSubview @info_container
    @color_view = create_color_view
    self.view.addSubview @color_view
    @tag_text_field = create_tag_text_field
    self.view.addSubview @tag_text_field
    @add_button = create_add_button
    self.view.addSubview @add_button
    finish_tag_text_field_layout
    setup_add_tag_event @add_button
    @table_view = create_tag_table
    @table_view.dataSource = self
    self.view.addSubview @table_view
  end

  def create_info_container
    info_container = UIView.alloc.initWithFrame(
        [[0,0], [self.view.frame.size.width, 60]]
    )
    info_container.backgroundColor = UIColor.lightGrayColor
    info_container
  end

  def create_color_view
    box_size = @info_container.frame.size.height - 2*PADDING
    color_view = UIView.alloc.initWithFrame([[PADDING, PADDING],
                                             [box_size, box_size]])
    color_view.backgroundColor = String.new(self.color.hex).to_color
    color_view
  end

  def create_tag_text_field
    text_field = UITextField.alloc.initWithFrame(CGRectZero)
    text_field.placeholder = 'tag'
    text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    text_field
  end

  def create_add_button
    add_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    add_button.setTitle('Add', forState: UIControlStateNormal)
    add_button.setTitle('Adding...', forState: UIControlStateDisabled)
    add_button.setTitleColor(UIColor.lightGrayColor, forState: UIControlStateDisabled)
    add_button.sizeToFit
    add_button.frame = [
        [self.view.frame.size.width - add_button.frame.size.width - PADDING,
        @color_view.frame.origin.y],
        [add_button.frame.size.width, @color_view.frame.size.height]
    ]
    add_button
  end

  def finish_tag_text_field_layout
    tag_text_field_origin = [
        @color_view.frame.origin.x + @color_view.frame.size.width + PADDING,
        @color_view.frame.origin.y
    ]
    add_button_offset = @add_button.frame.size.width + 2*PADDING
    @tag_text_field.frame = [
        tag_text_field_origin,
        [self.view.frame.size.width - tag_text_field_origin[0] - add_button_offset,
         @color_view.frame.size.height]
    ]
  end

  def setup_add_tag_event(add_button)
    add_button.when(UIControlEventTouchUpInside) do
      disable_controls
      self.color.add_tag(@tag_text_field.text) do |tag|
        if tag
          refresh
        else
          enable_controls
          @tag_text_field.text = 'Failed :('
        end
      end
    end
  end

  def disable_controls
    @add_button.enabled = false
    @tag_text_field.enabled = false
  end

  def refresh
    Color.find(self.color.hex) do |color|
      self.color = color
      @table_view.reloadData
      enable_controls
    end
  end

  def enable_controls
    @add_button.enabled = true
    @tag_text_field.enabled = true
  end

  def create_tag_table
    table_height = self.view.bounds.size.height - @info_container.frame.size.height
    table_frame = [[0, @info_container.frame.size.height],
                   [self.view.bounds.size.width, table_height]]
    table_view =UITableView.alloc.initWithFrame(table_frame,
                                                style: UITableViewStylePlain)
    table_view.autoresizingMask = UIViewAutoresizingFlexibleHeight
    table_view
  end


  def tableView(tableView, numberOfRowsInSection:section)
    self.color.tags.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= 'CELL_IDENTIFIER'
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    cell.textLabel.text = self.color.tags[indexPath.row].name
    cell
  end
end
