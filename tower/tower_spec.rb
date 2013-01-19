require 'rspec'
require_relative 'towers'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }

  it "should have three towers" do
    hanoi.towers.length.should == 3
  end

  its(:towers) { should eq([[1,2,3],[],[]]) }

  it "should move disks" do
    hanoi.move(1,2)
    hanoi.towers.should eq([[2,3],[1],[]])
  end

  it "shouldn't validate larger disks on smaller disks" do
    hanoi.move(1,2)
    hanoi.should_not have_valid_move(1,2)
  end

  it "shouldn't try to take a disk from an empty tower" do
    hanoi.should_not have_valid_move(2,3)
  end

  it "doesn't let you win prematurely" do
    hanoi.should_not be_win
  end

  it "lets you win at the right moment" do
    hanoi.move(1, 2)
    hanoi.move(1, 3)
    hanoi.move(2, 3)
    hanoi.move(1, 2)
    hanoi.move(3, 1)
    hanoi.move(3, 2)
    hanoi.move(1, 2)

    hanoi.should be_win
  end
end