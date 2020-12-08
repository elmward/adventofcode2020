require_relative './part1_functional.rb'

describe 'parse_instruction' do
  it 'handles plus signs' do
    expect(parse_instruction('nop +0')).to eq ['nop', 0]
  end

  it 'handles negative signs' do
    expect(parse_instruction('jmp -99')).to eq ['jmp', -99]
  end
end
