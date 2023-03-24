require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index { |cup, idx| cups[idx] = [:stone, :stone, :stone, :stone] unless [6,13].include?(idx) }
  end

  def valid_move?(start_pos)
    raise RuntimeError.new "Invalid starting cup" unless (0..13).include?(start_pos) 
    raise RuntimeError.new "Starting cup is empty" unless cups[start_pos].include?(:stone)
  end

  def make_move(start_pos, current_player_name)
    side1 = true if current_player_name == @name1
    side1 = false if current_player_name == @name2
    stones = cups[start_pos].length
    cups[start_pos] = []
    current_pos = start_pos

    while stones > 0
      current_pos = (current_pos + 1) % (cups.length)

      if current_pos == 6 && side1 == true
        cups[current_pos] << :stone 
        stones -= 1
      elsif current_pos == 13 && side1 == false
        cups[current_pos] << :stone 
        stones -= 1
      elsif ![6,13].include? current_pos 
        cups[current_pos] << :stone
        stones -= 1
      end
    end

    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if [6,13].include?(ending_cup_idx)

    if cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    case cups[6].length <=> cups[13].length
    when 0
      return :draw
    when 1
      return @name1
    when -1
      return @name2
    end

  end
end