describe 'ColorController' do

  it 'should set the color property' do
    controller = ColorController.new
    color = Color.new({hex: '000000'})
    controller.initWithColor(color)
    controller.color.should == color
  end

end