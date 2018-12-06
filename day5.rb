input = []
File.read('day5.txt').each_line do |l|
  input = l.chomp.split(//)
end

def process(array)
  counter = 0
  output = []
  delete = false
  (array.length - 1).times do |i|
    if delete
      delete = false
      next
    end

    if array[i] == array[i + 1].swapcase
      delete = true
      counter += 1
      next
    end
    output << array[i]
  end
  output << array[-1] unless delete
  [counter, output]
end

def test(input2)
  loop do
    a = process(input2)
    return a[1] if (a[0]).zero?

    input2 = a[1]
  end
end

intermediate = test(input)
counter = intermediate.length

('a'..'z').to_a.each do |letter|
  test_case = intermediate.reject { |x| x.downcase == letter}
  a = test(test_case)
  counter = a.length if a.length < counter
end
p counter
