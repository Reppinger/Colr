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
      result_data = BubbleWrap::JSON.parse(response.body.to_s)
      color_data = result_data['colors'][0]
      color = Color.new(color_data)
      if color.id.to_i == -1
        block.call nil
      else
        block.call(color)
      end

    end
  end

end
