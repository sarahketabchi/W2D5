require 'rspec'
require_relative 'two_sum'

describe "it should find two sum pairs" do

  it "should find no pairs in [0,1,2,3,4]" do
    [0,1,2,3,4].two_sum.should eq([])
  end

  it "should find one pair in [-1,0,1,2]" do
    [-1,0,1,2].two_sum.should eq([[-1, 1]])
  end

  it "should find more than one pair" do
    [1, 2, 4, -4, -1].two_sum.should eq([[1, -1], [4, -4]])
  end

  it "should work with empty arrays" do
    [].two_sum.should eq([])
  end

  it "should count 0,0 as a pair" do
    [0, 4, 6, 0].two_sum.should eq([[0, 0]])
  end

end