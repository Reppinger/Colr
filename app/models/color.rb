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

end
