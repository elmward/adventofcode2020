require_relative './handheld_computer.rb'

def parse_instruction(input)
  instr, operand = input.split
  Instruction.create(instr, operand.to_i)
end

def main
  program = File.foreach('./input.txt').map { |line| parse_instruction(line) }
  comp = HandheldComputer.new
  comp.load_program(program)
  comp.run_until_loop
  puts comp.acc
end

main if __FILE__ == $PROGRAM_NAME
