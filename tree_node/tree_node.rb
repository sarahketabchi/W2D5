class TreeNode
  attr_accessor :parent
  attr_reader :left_child, :right_child, :value

  def initialize(value)
    @value = value
    @parent = @left_child = @right_child = nil
  end

  def left_child=(node)
    @left_child.parent = nil unless @left_child.nil?
    @left_child = node
    @left_child.parent = self

  end

  def right_child=(node)
    @right_child.parent = nil unless @right_child.nil?
    @right_child = node
    @right_child.parent = self
  end

  def bfs(value)
    if @value == value
      true
    elsif @left_child.nil? && @right_child.nil?
      false
    elsif @left_child.nil?
      @right_child.bfs(value)
    elsif @right_child.nil?
      @left_child.bfs(value)
    else
      @right_child.bfs(value) || @left_child.bfs(value)
    end
  end

end