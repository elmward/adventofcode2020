def validate(character:, min:, max:, password:)
  count = password.count(character)
  count >= min && count <= max
end

def validate2(character:, min:, max:, password:)
  (password[min-1] == character) ^ (password[max-1] == character)
end

def parse(input)
  tokens = input.split
  range, character, password = tokens[0], tokens[1][0], tokens[2]
  min, max = range.split('-').map(&:to_i)
  {
    character: character,
    min: min,
    max: max,
    password: password,
  }
end

def count_valid(input)
  input.split("\n").count { |input_line| validate(**parse(input_line)) }
end

def count_valid2(input)
  input.split("\n").count { |input_line| validate2(**parse(input_line)) }
end

def main
  puts count_valid(File.open('./input.txt').read)
  puts count_valid2(File.open('./input.txt').read)
end

main if __FILE__ == $PROGRAM_NAME
