# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'
require 'webstub'
require 'motion-frank'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Colr'
  app.files_dependencies 'app/models/color.rb' => 'app/models/property_initializer.rb'
  app.files_dependencies 'app/models/tag.rb' => 'app/models/property_initializer.rb'
end