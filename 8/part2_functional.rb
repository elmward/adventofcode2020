require_relative './part1_functional.rb'

def fix_infinite_loop(program)
  program.each_with_index do |(instr, arg), i|
    next if instr == 'acc'
    new_program = program.dup
    new_program[i] = [instr == "jmp" ? "nop" : "jmp", arg]
    acc, cur = run(new_program)
    return acc if cur == program.count
  end

end

def main
  program = File.foreach('./input.txt').map { |line| parse_instruction(line) }
  puts fix_infinite_loop(program)
end

main if __FILE__ == $PROGRAM_NAME
