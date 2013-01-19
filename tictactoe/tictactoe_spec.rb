require 'rspec'
require_relative 'tictactoe'

# Basic shit for the Board
describe Board do
  subject(:game_board) { Board.new }

  its(:board) { eq([[nil, nil, nil],
                    [nil, nil, nil],
                    [nil, nil, nil]]) }

  it "should place a move" do
    game_board.place_token(1, 1, :x)
    game_board.board.should eq([[nil, nil, nil],
                                [nil, :x, nil],
                                [nil, nil, nil]])
  end

  it "shouldn't place a token where a token already exists" do
    game_board.place_token(1, 1, :x)

    expect do
      game_board.place_token(1, 1, :o)
    end.to raise_error(ArgumentError)
  end

  it "knows when someone has won" do
    game_board.board = [[:x, :o, :x],
                        [:o, :x, :o],
                        [:x, :o, nil]]
    game_board.should be_is_over
  end

  it "shouldn't falsely claim someone has won" do
    game_board.board = [[:x, :o, :x],
                        [:o, nil, :o],
                        [:x, :o, nil]]
    game_board.should_not be_is_over
  end

  it "should be over when the board is full" do
    game_board.board = [[:x, :o, :o],
                        [:o, :x, :x],
                        [:x, :o, :o]]
    game_board.should be_is_over
  end
end


# Basic shit for Player
describe Human do
  subject(:player) { Human.new(:x) }

  its(:token) { eq(:x) }

  # it "should give a move in the right format" do
  #   player.get_move.should be_an(Array)
  # end

  # it "should give a valid move" do
  #   player.get_move.length.should eq(2)
  # end
end

describe Computer do
  subject(:player) { Computer.new(:x) }

  its(:token) { eq(:x) }

  it "should give a move in the right format" do
    player.get_move.should be_an(Array)
  end

  it "should give a valid move" do
    player.get_move.length.should eq(2)
  end
end

# The thing

describe Tictactoe do
  subject(:game) { Tictactoe.new }

  its(:board) { should be_an(Board) }
  its(:player1) { should be_an(Player) }
  its(:player2) { should be_an(Player) }

  it "has a play method" do
    game.respond_to?(:play).should be_true
  end
end



