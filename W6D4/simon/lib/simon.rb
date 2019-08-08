class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      self.take_turn
    end
    if self.game_over
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    self.show_sequence
    sleep(1)
    system "clear"
    self.require_sequence
    if !self.game_over
      self.round_success_message
      self.sequence_length += 1
      sleep(2)
      system "clear"
    end
  end

  def show_sequence
    self.add_random_color
    puts "New color = #{self.seq[-1]}"
  end

  def require_sequence
    checker = @seq.dup
    until self.game_over || checker.empty?
      puts "Please repeat back the sequence, one color at a time."
      input = gets.chomp.downcase
      ans = checker.shift
      self.game_over = true if input != ans
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Correct sequence"
  end

  def game_over_message
    puts "Wrong sequnence, game over."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end


simon = Simon.new
simon.play
