class Color
  include PropertyInitializer

  PROPERTIES = [:timestamp, :hex, :id, :tags]
  PROPERTIES.each do |property|
    attr_accessor property
  end

  def tags
    @tags ||= []
  end

  def tags=(tags)
    @tags = tags.collect { |tag_hash| Tag.new(tag_hash) }
  end

  def self.find(hex, &block)
    BubbleWrap::HTTP.get("http://www.colr.org/json/color/#{hex}") do |response|
      color = create_color_from_response(response)
      call_block(color, &block)
    end
  end

  def self.create_color_from_response(response)
    result_data = BubbleWrap::JSON.parse(response.body.to_s)
    color_data = result_data['colors'][0]
    Color.new(color_data)
  end

  def self.call_block(color, &block)
    if no_color_found?(color)
      block.call nil
    else
      block.call(color)
    end
  end

  def self.no_color_found?(color)
    color.id.to_i == -1
  end
end
