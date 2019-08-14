dinner = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

def sluggish_octopus(dinner)
  longest_fish = dinner.first
  (0...dinner.length).each do |idx1|
    (0...dinner.length).each do |idx2|
      if dinner[idx1].length > dinner[idx2].length
        longest_fish = dinner[idx1]
      elsif dinner[idx1].length < dinner[idx2].length
        longest_fish = dinner[idx2]
      end
    end
  end
  longest_fish
end


class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end


def dominant_octopus(dinner)
  dinner2 = dinner.merge_sort { |x, y| y.length <=> x.length }
  dinner2[0]
end


def clever_octopus(dinner)
  longest_fish = dinner.first
  dinner.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end


# p clever_octopus(dinner)

#Octopus DDR
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dance(tile, tiles)
  tiles.each_with_index do |move, i|
    return i if move == tile
  end
end

# p slow_dance("up", tiles_array)
#=> 0

# p slow_dance("right-down", tiles_array)
#=> 3


new_tiles_data_structure = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7
}


def fast_dance(tile, tiles)
  tiles[tile]
end


p fast_dance("up", new_tiles_data_structure)
#=> 0

p fast_dance("right-down", new_tiles_data_structure)
#=> 3