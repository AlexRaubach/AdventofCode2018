$input = []
File.read('day8.txt').each_line do |l|
  $input = l.chomp.split(' ').map(&:to_i)
end
$metacounter = 0

class Tree
  attr_accessor :children, :metadata

  def initialize
    @children = []
    @metadata = []
  end

  def value
    return @metadata.sum if children.empty?

    node_value = 0

    @metadata.each do |num|
      index = num - 1
      next if index >= children.length || index == -1

      a = @children[index].value
      p index.to_s + '  ' + a.to_s
      node_value += a
    end
    node_value
  end
end

def build_tree
  children = $input.shift
  metadata = $input.shift
  tree = Tree.new
  children.times do
    tree.children << build_tree()
  end
  metadata.times do
    a = $input.shift
    $metacounter += a
    tree.metadata << a
  end

  tree
end

root = build_tree

# Part 1
p $metacounter

# Part 2
p root.value
