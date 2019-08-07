class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { |_| [] }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, i|
      cup.concat([:stone, :stone, :stone, :stone]) if i != 6 && i != 13
    end
  end

  def valid_move?(start_pos)
    valid_pos = [0,1,2,3,4,5,7,8,9,10,11,12]
    raise "Invalid starting cup" if valid_pos.none?(start_pos)
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
