input = []
File.read('day2.txt').each_line { |l| input << l.chomp }

#  x = {}

# two = 0
# three = 0

# input.each do |word|
#   if word.find_all {|char| word.count(char) == 2}.length > 0
#     two += 1
#   end
#   if word.find_all {|char| word.count(char) == 3}.length > 0
#     three += 1
#   end
# end 


def levenshtein_distance(s, t)
  m = s.length
  n = t.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) {Array.new(n+1)}

  (0..m).each {|i| d[i][0] = i}
  (0..n).each {|j| d[0][j] = j}
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                  d[i-1][j-1]       # no operation required
                else
                  [ d[i-1][j]+1,    # deletion
                    d[i][j-1]+1,    # insertion
                    d[i-1][j-1]+1,  # substitution
                  ].min
                end
    end
  end
  d[m][n]
end

input.each do |word|

  input.each do |word_2|
    if levenshtein_distance(word, word_2) == 1
      p word
      p word_2
      z = word.chars & word_2.chars
      return p z.join()
    end
  end
end
