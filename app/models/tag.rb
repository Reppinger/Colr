class Tag
  include PropertyInitializer

  PROPERTIES = [:timestamp, :id, :name]
  PROPERTIES.each do |property|
    attr_accessor property
  end

end