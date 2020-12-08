def parse_instruction(input)
  instr, arg = input.split
  [instr, arg.to_i]
end

def run(program)
  executed = {}
  cur = 0
  acc = 0
  while cur < program.count && !executed[cur] do
    instr, arg = program[cur]
    executed[cur] = true
    case instr
    when 'nop'
      cur += 1
    when 'jmp'
      cur += arg
    when 'acc'
      acc += arg
      cur += 1
    end
  end
  [acc, cur]
end

def main
  program = File.foreach('./input.txt').map { |line| parse_instruction(line) }
  puts run(program)[0]
end

main if __FILE__ == $PROGRAM_NAME
