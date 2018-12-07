require 'pry'
input = []
File.read('day7.txt').each_line do |l|
  input << l.chomp.split(' ')
end

$output = ''

$tasks = {}
('A'..'Z').to_a.each {|x| $tasks[x] = [] }

input.each do |array|
  $tasks[array[7]] << array[1]
end

def do_task(letter)
  # $tasks.delete(letter)
  $tasks.keys.each do |key|
    $tasks[key] = $tasks[key].reject {|i| i == letter }
  end
  $output += letter
end

def find_next_task
  $tasks.keys.each { |key| return key if $tasks[key].length.zero?}
  nil
end

def delete_task(letter)
  p letter
  $tasks.delete(letter)
end

class Worker
  attr_accessor :task, :time_left
  @worker_task = nil
  @time_left = 0

  def do_work
    return unless @worker_task

    if @time_left == 1
      do_task(@worker_task)
      @worker_task = nil
    else
      @time_left -= 1
    end
  end

  def check_for_work
    return false unless @worker_task.nil?

    @worker_task = find_next_task
    unless @worker_task.nil?
      delete_task(@worker_task)
      @time_left = 60 + (@worker_task.ord - 64)
    end
  end
end

@workers = []
5.times { @workers << Worker.new}

# @workers[0].check_for_work
# p @workers[0].task
time = 0
until $output.length == 26
  # Part 1

  # a = find_next_task
  # do_task(a)

  # Part 2

  @workers.each do |worker|
    worker.check_for_work
    worker.do_work
    worker.check_for_work
  end
  time += 1
end
time += 1
p $output
p time
