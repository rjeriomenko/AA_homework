class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
    end
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each { |color| puts; puts; puts; puts color }
  end

  def require_sequence #["red", "blue", "green", "yellow"]
    input_sequence = []

    until @game_over == true || input_sequence.length == sequence_length
      puts "Enter a color (red, blue, green, yellow)"
      input_sequence << gets.chomp
      @game_over = true unless input_sequence == seq[..input_sequence.length - 1]
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "round passed"
  end

  def game_over_message
    puts "you lost"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    puts "---------NEW GAME---------"
    self.play
  end
end