require_relative './part1.rb'
require_relative './handheld_computer.rb'

def fix_infinite_loop(program)
  comp = HandheldComputer.new
  program.each_with_index do |instr, i|
    next unless [Nop, Jmp].include? instr.class
    new_program = program.dup
    new_program[i] = Instruction.create(instr.class == Jmp ? "nop" : "jmp", instr.operand)
    comp.load_program(new_program)
    comp.run_until_loop
    return new_program if comp.cur == program.count
  end
end

def main
  program = File.foreach('./input.txt').map { |line| parse_instruction(line) }
  comp = HandheldComputer.new
  comp.load_program(fix_infinite_loop(program))
  comp.run_until_loop
  puts comp.acc
end

main if __FILE__ == $PROGRAM_NAME
