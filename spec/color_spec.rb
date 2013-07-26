describe 'Color' do

  it 'should accept properties in initialize' do
    timestamp = 1285886579
    hex = 'ff00ff'
    id = 3976
    tags =  {
            timestamp: 1108110851,
            id: 2583,
            name: 'fuchsia'
            }

    color = Color.new({ timestamp: timestamp,
                        hex: hex,
                        id:  id,
                        tags:  tags })
    color.timestamp.should == timestamp
    color.hex.should == hex
    color.id.should == id
    color.tags.should == tags
  end

  it 'should ignore keys that are not properties' do
    lambda {Color.new({ zzzzz: "I'm not a property"})}
            .should.not.raise(Exception)
  end

  it 'should return an empty array for tags if not tags are supplied' do
    color = Color.new()
    color.tags.should == []
  end
end