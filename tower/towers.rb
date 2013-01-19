#!/usr/bin/env ruby
class Hanoi
  attr_reader :towers

  def initialize
    @towers = [[1,2,3],[],[]]
  end

  def play
    until win?
      from, to = get_move.split(',')
      move(from.to_i, to.to_i)
    end
    puts "You win!"
  end

  def get_move
    puts "What's your move? ex: 1,2"
    gets.chomp
  end

  def has_valid_move?(from, to)
    return false if @towers[from - 1].empty?
    return true if @towers[to - 1].first.nil?
    return false if @towers[from - 1].first > @towers[to - 1].first
    true
  end

  def move(from, to)
    @towers[to-1].unshift(@towers[from-1].shift) if has_valid_move?(from, to)
  end

  def win?
    @towers[1..-1].each do |tower|
      if (@towers[0].empty? && tower.empty?)
        return true
      end
    end
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  Hanoi.new.play
end