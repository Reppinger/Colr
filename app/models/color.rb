class Color
  include PropertyInitializer

  PROPERTIES = [:timestamp, :hex, :id, :tags]
  PROPERTIES.each do |property|
    attr_accessor property
  end

  def tags
    @tags ||= []
  end
end