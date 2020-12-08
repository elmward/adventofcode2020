require_relative './handheld_computer.rb'
require_relative './part1.rb'

describe 'parse_instruction' do
  it 'parses a nop' do
    expect(parse_instruction('nop +0')).to eq Nop.new(0)
  end

  it 'parses a jmp' do
    expect(parse_instruction('jmp +50')).to eq Jmp.new(50)
  end

  it 'parses an acc' do
    expect(parse_instruction('acc -50')).to eq Acc.new(-50)
  end
end
