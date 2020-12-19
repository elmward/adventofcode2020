def next_number(numbers)
  num = numbers.last
  prev_index = numbers[0..-2].rindex(num)
  prev_index ? numbers.count - prev_index - 1 : 0
end

def main
  numbers = [8,11,0,19,1,2]
  until numbers.count == 2020
    numbers << next_number(numbers)
  end
  puts numbers[-1]
end

main if __FILE__ == $PROGRAM_NAME
