describe 'Tag' do

  it 'should accept properties in initialize' do
    timestamp = 1108110851,
    id = 2583,
    name = 'fuchsia'

    tag = Tag.new({ timestamp: timestamp,
                             id: id,
                           name: name })
    tag.timestamp.should == timestamp
    tag.id.should == id
    tag.name.should == name
  end

  it 'should ignore keys that are not properties' do
    lambda {Tag.new({ zzzzz: "I'm not a property"})}
    .should.not.raise(Exception)
  end

end