require_relative './part2_functional.rb'

describe 'fix_infinite_loop' do
  let(:program) do
    [
      ["nop", 0],
      ["acc", 1],
      ["jmp", 4],
      ["acc", 3],
      ["jmp", -3],
      ["acc", -99],
      ["acc", 1],
      ["jmp", -4],
      ["acc", 6],
    ]
  end

  it 'changes jmps and nops until the program terminates' do
    expect(fix_infinite_loop(program)).to eq 8
  end
end
