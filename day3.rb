input = []
@fabric = []
File.read('day3.txt').each_line { |l| input << l.chomp.split(' ') }

1000.times do
  array = []
  1000.times do
    array << 0
  end
  @fabric << array
end

def part_area(y_coord, x_coord, height, width)
  height.times do |height_add|
    width.times do |width_add|
      @fabric[x_coord + width_add][y_coord + height_add] += 1
    end
  end
end

input.each do |item_array|
  coords = item_array[2].split(',')
  demns = item_array[3].split('x')
  part_area(coords[0].to_i, coords[1].to_i, demns[0].to_i, demns[1].to_i)
end

counter = 0
@fabric.each do |line|
  line.each do |item|
    counter += 1 if item > 1
  end
end
p counter

def find_lone_part(y_coord, x_coord,  height, width)
  height.times do |height_add|
    width.times do |width_add|
      return false if @fabric[x_coord + width_add][y_coord + height_add] > 1
    end
  end
  true
end

input.each do |item_array|
  coords = item_array[2].split(',')
  demns = item_array[3].split('x')
  puts item_array if find_lone_part(coords[0].to_i, coords[1].to_i, demns[0].to_i, demns[1].to_i)
end
