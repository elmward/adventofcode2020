def joltage_differences(joltages)
  joltages = joltages.sort.insert(0, 0) # the outlet
  Hash.new(0).tap do |diffs|
    diffs[3] = 1 # the device's built-in adapter
    joltages.each_with_index do |x, i|
      unless i == joltages.count - 1
        y = joltages[i+1]
        diffs[y-x] = diffs[y-x] + 1
      end
    end
  end
end

def valid_arrangements(joltages)
  joltages = joltages.sort.insert(0, 0)
  joltages << joltages.last + 3
  runs = joltages.chunk_while { |i, j| i + 1 == j }.select{ |chunk| chunk.length > 2}
  runs.map{ |run| (2 ** (run.length - 2)) - invalid_paths_for_run(run.length) }.reduce(:*)
end

def invalid_paths_for_run(length)
  if length <= 4
    0
  else
    (1..length-4).sum
  end
end

def main
  joltages = File.open('./input.txt').readlines.map(&:to_i)
  diffs = joltage_differences(joltages)
  puts diffs[1] * diffs[3]
  puts valid_arrangements(joltages)
end

main if __FILE__ == $PROGRAM_NAME
