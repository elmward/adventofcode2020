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
  i, j = [0, 1]
  total = input[i..j].sum
  while total != n
    if total < n
      j += 1
      total += input[j]
    else
      total -= input[i]
      i += 1
    end
  end
  [i,j]
end

def main
  numbers = File.open('./input.txt').readlines.map(&:to_i)
  n = numbers[25..].each_with_index do |n, i|
    break n if !valid?(numbers[i..i+25], n)
  end
  puts n
  i, j = find_range(numbers, n)
  range = numbers[i..j]
  puts(range.min + range.max)
end

main if __FILE__ == $PROGRAM_NAME
