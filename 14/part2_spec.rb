require_relative './part2.rb'

describe 'day 14 part 2' do
  describe 'apply_mask' do
    context 'with a very simple bitmask' do
      let (:mask) { '1X0' }

      it 'turns 110 into 110 and 100' do
        expect(apply_mask(6, mask)).to eq [4, 6]
      end

      it 'turns 001 into 111 and 110' do
        expect(apply_mask(1, mask)).to eq [5, 7]
      end

      it 'turns 010 into 100 and 110' do
        expect(apply_mask(4, mask)).to eq [4, 6]
      end
    end

    context 'with a two-x bitmask' do
      let (:mask) { 'X1X0' }

      it 'turns 6 into 4, 6, 12, and 14' do
        expect(apply_mask(6, mask).sort).to eq [4, 6, 12, 14]
      end

      it 'turns 1 into 5, 7, 13, and 15' do
        expect(apply_mask(1, mask).sort).to eq [5, 7, 13, 15]
      end
    end
  end
end
