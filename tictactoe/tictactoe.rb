require 'debugger'

class Tictactoe
  attr_reader :player1, :player2, :board

  def initialize
    @board = Board.new
    @player1 = Human.new(:x)
    @player2 = Computer.new(:o)
  end

  def play

  end
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) { nil } }
  end

  def place_token(row, col, token)
    raise ArgumentError unless @board[row][col].nil?
    @board[row][col] = token
  end

  def is_over?
    [[:x,:x,:x],[:o,:o,:o]].each do |combo|
      return true if (get_rows + get_cols + get_diags).include?(combo)
    end

    @board.each do |row|
      return false if row.include?(nil)
    end

    true
  end

  private

  def get_rows
    rows = []
    rows << @board[0] << board[1] << board[2]
  end

  def get_cols
    cols = []
    (0..2).each do |i1|
      temp_col = []
      (0..2).each do |i2|
        temp_col << @board[i2][i1]
      end
      cols << temp_col
    end

    cols
  end

  def get_diags
    diags = []
    diags << [@board[0][0], @board[1][1], @board[2][2]]
    diags << [@board[0][2], @board[1][1], @board[2][0]]
  end
end


class Player
  def initialize(token)
    @token = token
  end
end

class Human < Player
  def get_move
    puts "Please enter which square you want to claim"
    gets.chomp.split(',')
  end
end

class Computer < Player
  def get_move
    [rand(2),rand(2)]
  end
end