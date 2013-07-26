class SearchController < UIViewController
  def viewDidLoad
    super
    self.title = 'Search'
    self.view.backgroundColor = UIColor.whiteColor
    build_view
  end

  def build_view
    @text_field = create_search_text_field
    self.view.addSubview(@text_field)
    search_button = create_search_button @text_field.center.y
    self.view.addSubview(search_button)
    setup_search_event search_button
  end

  def setup_search_event(search_button)
    search_button.when(UIControlEventTouchUpInside) do
      search_button.enabled = false
      @text_field.enabled = false
      hex = @text_field.text
      Color.find(hex) do |color|
        if color.nil?
          search_button.setTitle('None :(', forState: UIControlStateNormal)
        else
          search_button.setTitle('Search', forState: UIControlStateNormal)
          self.open_color(color)
        end
        search_button.enabled = true
        @text_field.enabled = true
      end
    end
  end

  def open_color(color)
    p "Opening #{color.inspect}"
  end

  def create_search_text_field
    text_field = UITextField.alloc.initWithFrame [[0, 0], [160, 26]]
    text_field.placeholder = '#abcabc'
    text_field.textAlignment = UITextAlignmentCenter
    text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.center = [
        self.view.frame.size.width / 2,
        self.view.frame.size.height / 2 - 100
    ]
    text_field
  end

  def create_search_button(text_field_center_y)
    search_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    search_button.setTitle('Search', forState: UIControlStateNormal)
    search_button.setTitle('Loading', forState: UIControlStateDisabled)
    search_button.sizeToFit
    search_button.center = [self.view.frame.size.width / 2,
                            text_field_center_y + 40]
    search_button
  end
end