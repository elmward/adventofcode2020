class Slope
  def initialize(map)
    @map = map
    @width = map[0].count
    @height = map.count
  end

  def move_hits?(x, y, dx, dy)
    @map[y+dy][(x+dx) % @width] == '#'
  end

  def num_hits(x, y, dx, dy)
    hits = 0
    while y < @height - 1
      hits +=1 if move_hits?(x, y, dx, dy)
      x += dx
      y += dy
    end
    hits
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
  the_hill = Slope.new(map)

  slopes.each do |slope|
    puts "Slope: #{slope} has #{the_hill.num_hits(0, 0, *slope)} hits"
  end

  puts slopes.map{ |slope| the_hill.num_hits(0, 0, *slope) }.reduce(&:*)
end

main if __FILE__ == $PROGRAM_NAME
