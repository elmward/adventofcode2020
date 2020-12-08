require_relative './part2.rb'

describe 'fix_infinite_loop' do
  let(:program) do
    [
      Instruction.create("nop", 0),
      Instruction.create("acc", 1),
      Instruction.create("jmp", 4),
      Instruction.create("acc", 3),
      Instruction.create("jmp", -3),
      Instruction.create("acc", -99),
      Instruction.create("acc", 1),
      Instruction.create("jmp", -4),
      Instruction.create("acc", 6),
    ]
  end

  it 'changes jmps and nops until the program terminates' do
    computer = HandheldComputer.new
    computer.load_program(fix_infinite_loop(program))
    computer.run_until_loop
    expect(computer.cur).to eq 9
    expect(computer.acc).to eq 8
  end
end
