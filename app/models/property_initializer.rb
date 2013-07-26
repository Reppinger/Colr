module PropertyInitializer
  def initialize(properties = {})
    properties.each do |property, value|
      if is_a_property?(property)
        self.send(("#{property}="), value)
      end
    end
  end

  def is_a_property?(property)
    self.respond_to? property.to_sym
  end

end
