def apply_mask(num, mask)
  addend = mask.chars.reverse.each_with_index.map do |char, i|
    char == 'X' ? 0 : char.to_i * (2**i)
  end.reduce(&:+)
  and_mask = mask.chars.reverse.each_with_index.map do |char, i|
    char == 'X' ? 2**i : 0
  end.reduce(&:+)
  (num & and_mask) + addend
end

def main
  mask = ''
  memory = {}
  File.foreach('./input.txt') do |line|
    line = line.strip
    if line.start_with?('mask')
      mask = line.split(' = ')[1]
    else
      addr, val = /mem\[(\d+)\] = (\d+)/.match(line).captures.map(&:to_i)
      memory[addr] = apply_mask(val, mask)
    end
  end
  puts memory.values.sum
end

main if __FILE__ == $PROGRAM_NAME
