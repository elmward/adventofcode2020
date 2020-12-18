def apply_mask(num, mask)
  # probably should be a reduce
  mask.chars.reverse.each_with_index.reduce([0]) do |addresses, (c, i)|
    case c
    when '0'
      addresses = addresses.map { |addr| addr + (num & 2**i) }
    when '1'
      addresses = addresses.map { |addr| addr + 2**i }
    when 'X'
      addresses = addresses.map { |addr| [addr, addr + 2**i] }.flatten
    end
  end
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
      apply_mask(addr, mask).each do |addr|
        memory[addr] = val
      end
    end
  end
  puts memory.values.sum
end

main if __FILE__ == $PROGRAM_NAME
