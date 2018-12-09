$player_number = 458
$last_marble_number = 72019 *100

# This gets pretty slow. Should have used a doubly linked list
$marble_grid = [0, 1]
$players = Array.new($player_number, 0)
$current_marble = 2
$index = 1

def add_marble
  new_index = ($index + 2) % $marble_grid.length
  new_index = $marble_grid.length if new_index == 0
  $marble_grid.insert(new_index, $current_marble)

  $current_marble +=1
  $index = new_index
end

def score
  player_num = $current_marble % $players.length
  
  removal_index = $index - 7
  removal_index += $marble_grid.length if removal_index < 0
  score = $current_marble + $marble_grid.slice!(removal_index)

  $players[player_num] += score
  $index = removal_index

  $current_marble +=1
end

until $current_marble > $last_marble_number
  if ($current_marble % 23).zero?
    score
  else
    add_marble
  end
end

p $players.max
