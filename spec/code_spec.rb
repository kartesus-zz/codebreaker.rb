require './lib/code'

RSpec.describe Code do
  it "generates a 4-digit secret array" do
    code = Code.new
    expect(code.secret).to be_a(Array)
    expect(code.secret.size).to be(4)
  end

  it "returns :+ for each exact match" do
    code = Code.new([1,2,3,4])
    expect(code.check([1,3,4,2]).select{|x| x === :+}.size).to be(1)
    expect(code.check([1,2,4,3]).select{|x| x === :+}.size).to be(2)
    expect(code.check([1,2,3,3]).select{|x| x === :+}.size).to be(3)
    expect(code.check([1,2,3,4]).select{|x| x === :+}.size).to be(4)
  end

  it "returns :- for each number match" do
    code = Code.new([1,2,3,4])
    expect(code.check([4,5,5,5]).select{|x| x === :-}.size).to be(1)
    expect(code.check([4,4,5,5]).select{|x| x === :-}.size).to be(2)
    expect(code.check([4,4,4,5]).select{|x| x === :-}.size).to be(3)
    expect(code.check([4,4,4,1]).select{|x| x === :-}.size).to be(4)
  end

  it "returns :x for each mismatch" do
    code = Code.new([1,2,3,4])
    expect(code.check([5,2,3,4]).select{|x| x === :x}.size).to be(1)
    expect(code.check([5,5,3,4]).select{|x| x === :x}.size).to be(2)
    expect(code.check([5,5,5,4]).select{|x| x === :x}.size).to be(3)
    expect(code.check([5,5,5,5]).select{|x| x === :x}.size).to be(4)
  end

  it "raises error when initializing with invalid secret" do
    expect { Code.new("1234") }.to raise_error(ArgumentError)
  end

  it "raises error when checked secret is invalid" do
    expect { Code.new.check("1234") }.to raise_error(ArgumentError)
  end
end
