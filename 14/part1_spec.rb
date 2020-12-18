require_relative './part1.rb'

describe 'day 14 part 1' do
  describe 'apply_mask' do
    context 'with a very simple bitmask' do
      let (:mask) { '1X0' }

      it 'turns 7 into 6' do
        expect(apply_mask(7, mask)).to eq 6
      end

      it 'turns 1 into 4' do
        expect(apply_mask(7, mask)).to eq 6
      end

      it 'turns 4 into 4' do
        expect(apply_mask(4, mask)).to eq 4
      end
    end

    context 'with sample bitmask' do
      let (:mask) { 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X' }

      it 'turns 11 into 73' do
        expect(apply_mask(11, mask)).to eq 73
      end

      it 'turns 101 into 101' do
        expect(apply_mask(101, mask)).to eq 101
      end

      it 'turns 0 into 64' do
        expect(apply_mask(0, mask)).to eq 64
      end
    end
  end
end
