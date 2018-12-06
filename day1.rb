a = File.read('day1.txt')
freq = 0

a.each_line do |line|
  freq += line.to_i
end
p freq

counter = {}

loop do
  a.each_line do |line|
    freq += line.to_i
    return p freq if counter[freq]

    counter[freq] = true
  end
end
