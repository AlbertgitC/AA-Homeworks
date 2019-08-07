class Board
  attr_accessor :cups
  attr_reader :player1, :player2

  def initialize(name1, name2)
    @cups = Array.new(14) { |_| [] }
    self.place_stones
    @player1 = name1
    @player2 = name2
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
    stones = self.cups[start_pos].length
    self.cups[start_pos] = []
    if current_player_name == self.player1
      i = 1
      while stones >= i
        pos = (start_pos + i) % 14
        if pos != 13
          self.cups[pos] << :stone 
          i += 1
        else
          i += 1
          stones += 1
        end
      end
      self.render
      self.next_turn((stones + start_pos) % 14)
    else
      i = 1
      while stones >= i
        pos = (start_pos + i) % 14
        if pos != 6
          self.cups[pos] << :stone 
          i += 1
        else
          i += 1
          stones += 1
        end
      end
      self.render
      self.next_turn((stones + start_pos) % 14)
    end
    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif self.cups[ending_cup_idx].length == 1
      return :switch 
    else
      return ending_cup_idx
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
    self.cups[0..5].all?([]) || self.cups[7..12].all?([])
  end

  def winner
    case self.cups[13].length <=> self.cups[6].length
    when -1
      return self.player1
    when 0
      return :draw
    when 1
      return self.player2
    end
  end
end
