TEST_INPUTS = %w[
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
].map(&:to_i)

def valid?(preamble, n)
  preamble.any? { |x| preamble.include?(n-x) }
end

def find_range(input, n)
  input.each_with_index do |x, i|
    puts "considering range starting with #{i} (value #{x})"
    j = i
    total = n
    while total-x >= 0 && j < input.count
      puts "#{x} is ok, #{total-x} left"
      total -= x
      if total == 0
        puts "found range [#{i}, #{j}]"
        return [i, j]
      end
      j += 1
      x = input[j]
    end
  end
end

def main
  numbers = File.open('./input.txt').readlines.map(&:to_i)
  numbers[25..].each_with_index do |n, i|
    puts n if !valid?(numbers[i..i+25], n)
  end
  range = find_range(numbers, 14144619)
  the_range = numbers[range[0]..range[1]]
  puts (the_range.min + the_range.max)
end

main if __FILE__ == $PROGRAM_NAME
