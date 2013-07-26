describe 'Color' do

  it 'accepts properties in initialize' do
    timestamp = 1285886579
    hex = 'ff00ff'
    id = 3976

    color = Color.new({ timestamp: timestamp,
                        hex: hex,
                        id:  id})
    color.timestamp.should == timestamp
    color.hex.should == hex
    color.id.should == id
  end

  it 'ignores keys that are not properties' do
    lambda {Color.new({ zzzzz: "I'm not a property"})}
            .should.not.raise(Exception)
  end

  it 'returns an empty array for tags if not tags are supplied' do
    color = Color.new()
    color.tags.should == []
  end

  it 'sets tag property to array of Tag objects' do
    tags =  [{
                 timestamp: 1108110851,
                 id: 2583,
                 name: 'fuchsia'
             },
             {
                 timestamp: 1108110852,
                 id: 2222,
                 name: 'not pink'
             }]
    color = Color.new({ tags: tags})
    color.tags.count.should == 2
  end

  it 'creates Tag object with correct properties' do
    timestamp = 1108110851
    id = 2583
    name = 'fuchsia'
    tags =  [{
                 timestamp: 1108110851,
                 id: id,
                 name: name
             }]
    color = Color.new({ tags: tags})
    color.tags.first.timestamp.should == timestamp
    color.tags.first.id.should == id
    color.tags.first.name.should == name
  end

  it 'raises an exception if any of the tags is not a hash' do
    tags =  [{
                 timestamp: 1108110851,
                 id: 1234,
                 name: 'I am a in a hash'
             },
              'I am not a hash of tag properties']
    lambda {Color.new({ tags: tags})}.should.raise(Exception)
  end

end