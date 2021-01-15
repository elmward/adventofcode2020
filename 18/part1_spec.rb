require_relative './part1.rb'

describe 'subexpression' do
  it 'determines correct subexp starting at given index' do
    expect(subexpression('2 * 3 + (4 * (5 + 6))', 8)).to eq '4 * (5 + 6)'
    expect(subexpression('2 * 3 + (4 + 5)', 8)).to eq '4 + 5'
  end
end

describe 'do_math' do
  context 'with no grouping' do
    it 'does the math' do
      expect(do_math('2 * 3 + 4 * 5')).to eq 50
    end
  end

  context 'with a non-nested group' do
    it 'does the math' do
      expect(do_math('2 * 3 + (4 * 5)')).to eq 26
    end
  end

  context 'with a nested group' do
    it 'does the math' do
      expect(do_math('2 * 3 + (4 * (5 + 6))')).to eq 50
    end
  end

  context 'with a nested group and more at the end' do
    it 'does the math' do
      expect(do_math('2 * 3 + (4 * (5 + 6)) + 7')).to eq 57
    end
  end

  context 'with multiple internally nested groups' do
    it 'does the math' do
      expect(do_math('2 * 3 + (4 * (5 + 6) + 7) + 8')).to eq 65
    end
  end
end
