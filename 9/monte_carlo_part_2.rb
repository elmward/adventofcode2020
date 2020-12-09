require_relative './part1.rb'

def main
  1_000_000.times do |i|
    input = 1000.times.map { rand(1_000_000_000) }
    lower = rand(998)
    upper = rand((lower + 1)..(input.count - 1))
    expected = input[lower..upper].sum
    i, j = find_range(input, expected)
    if [i, j] != [lower, upper]
      puts "Bad solution for run #{i}"
      puts "expected to find #{lower}, #{upper}, found #{i}, #{j}"
      puts "expected sum was #{expected} and actual sum was #{input[i..j].sum}"
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
