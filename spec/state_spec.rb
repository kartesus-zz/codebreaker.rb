require './lib/state'

RSpec.describe State do

  it "is equivalent the it's status" do
    expect(State.new(:foo, [])).to be === :foo
  end
end
