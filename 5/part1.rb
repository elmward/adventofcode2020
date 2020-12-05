def binary_partition(spec, low_char:, high_char:)
  min = 0
  max = 2 ** spec.chars.count - 1
  spec.chars.each do |char|
    case char
    when low_char
      max -= (max-min+1)/2
    when high_char
      min += (max-min+1)/2
    end
  end
  max
end

def row(row_spec)
  binary_partition(row_spec, low_char: 'F', high_char: 'B')
end

def column(column_spec)
  binary_partition(column_spec, low_char: 'L', high_char: 'R')
end

def seat_id(boarding_pass)
  row = row(boarding_pass.chars.first(7).join)
  column = column(boarding_pass.chars.last(3).join)
  (row * 8) + column
end

def main
  boarding_passes = File.open('./input.txt').read.split("\n")
  puts "part1: #{boarding_passes.map { |pass| seat_id(pass) }.max}"
  sorted_ids = boarding_passes.map { |pass| seat_id(pass) }.sort
  sorted_ids.each_with_index do |id, i|
    if id + 1 != sorted_ids[i + 1]
      puts "part2: #{id + 1}"
      break
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
