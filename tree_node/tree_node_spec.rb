require 'rspec'
require_relative 'tree_node'

# Preliminary stuff to make sure TreeNode objects get created
describe TreeNode do
  subject(:tree_node) { TreeNode.new(10) }

  its(:left_child) { should eq(nil) }
  its(:right_child) { should eq(nil) }
  its(:parent) { should eq(nil) }
  its(:value) { should eq(10) }

  let(:right_child) { double("right_child",
                      :parent => nil,
                      :parent= => nil,
                      :left_child => nil,
                      :right_child => nil)}

  let(:left_child) { double("left_child",
                      :parent => nil,
                      :parent= => nil,
                      :left_child => nil,
                      :right_child => nil)}

  let(:better_right_child) { double("better_right_child",
                      :parent => nil,
                      :parent= => nil,
                      :left_child => nil,
                      :right_child => nil)}

  let(:better_left_child) { double("better_left_child",
                      :parent => nil,
                      :parent= => nil,
                      :left_child => nil,
                      :right_child => nil)}

  describe "adds kids" do
    it "makes a left child" do
      tree_node.left_child = left_child
      tree_node.left_child.should eq(left_child)
    end


    it "makes a right child" do
      tree_node.right_child = right_child
      tree_node.right_child.should eq(right_child)
    end
  end

  describe "become a kid" do
    it "sets its parent when it becomes a left child" do
      left_child.should_receive(:parent=).with(tree_node)
      tree_node.left_child = left_child
    end

    it "sets its parent when it becomes a right child" do
      right_child.should_receive(:parent=).with(tree_node)
      tree_node.right_child = right_child
    end
  end

  describe "orphans unwanted kids" do
    it "disowns previous left_child when new, better one comes along" do
      tree_node.left_child = left_child
      left_child.should_receive(:parent=).with(nil)
      tree_node.left_child = better_left_child
    end

    it "disowns previous right_child when new, better one comes along" do
      tree_node.right_child = right_child
      right_child.should_receive(:parent=).with(nil)
      tree_node.right_child = better_right_child
    end
  end
end

# Searching stuff
describe "searching for stuff" do
  subject(:root) { TreeNode.new(1) }
  let(:two) { TreeNode.new(2) }
  let(:three) { TreeNode.new(3) }
  let(:four) { TreeNode.new(4) }
  let(:five) { TreeNode.new(5) }
  let(:six) { TreeNode.new(6) }

  before do
    root.left_child = two
    root.right_child = three
    two.left_child = four
    three.left_child = five
    three.right_child = six
  end

  describe "can find stuff" do

    it "finds six" do
      root.bfs(six.value).should be_true
    end

    it "finds five" do
      root.bfs(five.value).should be_true
    end

    it "finds four" do
      root.bfs(four.value).should be_true
    end

    it "finds three" do
      root.bfs(three.value).should be_true
    end

    it "finds two" do
      root.bfs(two.value).should be_true
    end

    it "doesn't find seven" do
      root.bfs(7).should be_false
    end

  end
end