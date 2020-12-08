require_relative './handheld_computer.rb'

describe HandheldComputer do
  let(:program) do
    [
      Instruction.create("nop", 0),
      Instruction.create("acc", 1),
      Instruction.create("jmp", 2),
      Instruction.create("acc", 3),
      Instruction.create("acc", -3),
      Instruction.create("nop", 0),
    ]
  end

  it "has an accumulator that starts at zero" do
    expect(subject.acc).to eq 0
  end

  it "has an instruction pointer that starts at zero" do
    expect(subject.cur).to eq 0
  end

  describe "#load_program" do
    it "accepts a program" do
      expect { subject.load_program(program) }.not_to raise_error
    end
  end

  describe "#run_until_loop" do
    it "runs the program until it finishes" do
      subject.load_program(program).run_until_loop
      expect([subject.acc, subject.cur]).to eq [-2, program.count]
    end

    context "with an infinite loop" do
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

      it "runs the program until it encounters a loop" do
        subject.load_program(program).run_until_loop
        expect([subject.acc, subject.cur]).to eq [5, 1]
      end
    end
  end
end

describe Nop do
  subject { described_class.new(500) }

  describe "#execute" do
    it "does nothing but sends you to the next instruction" do
      expect(subject.execute.acc_delta).to eq 0
      expect(subject.execute.jump).to eq 1
    end
  end
end

describe Acc do
  subject { described_class.new(500) }

  describe "#execute" do
    it "adds the given operand" do
      expect(subject.execute.acc_delta).to eq 500
      expect(subject.execute.jump).to eq 1
    end
  end
end

describe Jmp do
  subject { described_class.new(10) }

  describe "#execute" do
    it "jumps by the given amount" do
      expect(subject.execute.acc_delta).to eq 0
      expect(subject.execute.jump).to eq 10
    end
  end
end

describe Instruction do
  describe ".create" do
    it "creates the given instruction" do
      expect(described_class.create("nop", 1)).to be_a(Nop)
      expect(described_class.create("jmp", 1)).to be_a(Jmp)
      expect(described_class.create("acc", 1)).to be_a(Acc)
    end
  end

  describe "#execute" do
    subject { described_class.new(1) }

    it "is not implemented" do
      expect { subject.execute }.to raise_error(NotImplementedError)
    end
  end

  describe "#==" do
    it "is true if class and operand are equal" do
      expect(described_class.create('nop', 0)).to eq (described_class.create('nop', 0))
    end

    it "is false if class is different" do
      expect(described_class.create('jmp', 0)).not_to eq (described_class.create('nop', 0))
    end

    it "is false if operand is different" do
      expect(described_class.create('jmp', 50)).not_to eq (described_class.create('jmp', 0))
    end
  end
end
