def prepare_map(input)
  input.split("\n").map(&:chars)
end

def select_rows(dy, tree_map)
  (1..tree_map.count - 1).select { |i| i % dy == 0 }.map { |i| tree_map[i] }
end

def hit?(step, dx, row)
  x = step * dx
  row[x % row.count] == '#'
end

def count_trees(dx, dy, tree_map)
  select_rows(dy, tree_map).each_with_index.reduce(0) do |acc, (row, i)|
    hit?(i+1, dx, row) ? acc += 1 : acc
  end
end

def main
  map = File.open('./input.txt').read.split("\n").map(&:chars)
  slopes = [
    [1,1],
    [3,1],
    [5,1],
    [7,1],
    [1,2],
  ]
  puts slopes.map{ |slope| count_trees(*slope, map) }.reduce(&:*)
end

main if __FILE__ == $PROGRAM_NAME
