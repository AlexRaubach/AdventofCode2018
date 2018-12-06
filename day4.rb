input_array = []
File.read('day4.txt').each_line do
  |l| input_array << l.chomp.gsub('[', '').gsub(']', '').split(' ')
end

input_array.sort! { |x, y| x[0] + x[1] <=> y[0] + y[1] }
guards = {}

@recent_guard = nil
asleep = nil

input_array.each do |input|
  case input[2]
  when 'Guard'
    @recent_guard = input[3]
  when 'falls'
    asleep = input[1][3..4].to_i
  when 'wakes'
    guards[@recent_guard] = Array.new(60, 0) if guards[@recent_guard].nil?

    wake = input[1][3..4].to_i
    (wake - asleep).times do |i|
      guards[@recent_guard][asleep + i] += 1
    end
  end
end

p guards['#2081'].each_with_index.max[1]
