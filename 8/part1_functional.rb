def parse_instruction(input)
  instr, arg = input.split
  [instr, arg.to_i]
end

def run(program)
  executed, cur, acc = [{}, 0, 0]
  while cur < program.count && (instr, arg = program[cur]) do
    program[cur] = nil
    acc, cur = [instr == 'acc' ? acc+arg : acc, instr == 'jmp' ? cur + arg : cur+1]
  end
  [acc, cur]
end

def main
  program = File.foreach('./input.txt').map { |line| parse_instruction(line) }
  puts run(program)[0]
end

main if __FILE__ == $PROGRAM_NAME
