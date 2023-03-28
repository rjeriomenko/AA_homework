fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

def sluggish(array_of_fish)
    array_of_fish.each do |my_fish|
        return my_fish if array_of_fish.all? do |other_fish|
            if my_fish == other_fish
                true
            else
                my_fish.length >= other_fish.length
            end
        end
    end
end

p sluggish(fish)

def dominant(array_of_fish)
    merge_sort(array_of_fish).last
end

def merge_sort(array_of_fish)
    return array_of_fish if array_of_fish.length < 2

    mid_idx = array_of_fish.length / 2

    left = merge_sort(array_of_fish.take(mid_idx))
    right = merge_sort(array_of_fish.drop(mid_idx))

    merge(left, right)
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            merged << left.shift
        else
            merged << right.shift
        end
    end

    merged + left + right
end

p dominant(fish)

def clever(array_of_fish)
    longest_fish = ""

    array_of_fish.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end

    longest_fish
end

p clever(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]

def slow_dance(target, array_of_tiles)
    array_of_tiles.each_with_index do |tile, idx|
        return idx if tile == target
    end
end

p slow_dance("up", tiles_array)

p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {}
tiles_array.each_with_index do |tile, idx|
    new_tiles_data_structure[tile] = idx
end

p new_tiles_data_structure

def fast_dance(target, new_tiles_data_structure)
    new_tiles_data_structure[target]
end

p fast_dance("up", new_tiles_data_structure)
# 0

p fast_dance("right-down", new_tiles_data_structure)
# 3
