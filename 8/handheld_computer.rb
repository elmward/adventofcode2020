class HandheldComputer
  attr_reader :acc, :cur

  def initialize()
    @acc = 0
    @cur = 0
    @program = []
  end

  def load_program(program)
    @acc = 0
    @cur = 0
    @program = program
    self
  end

  def run_until_loop
    executed = Hash.new(false)
    while @cur < @program.count && !executed[@cur] do
      result = @program[@cur].execute
      executed[@cur] = true
      @acc += result.acc_delta
      @cur += result.jump
    end
  end
end

class Instruction
  OPS = [
    NOP = "nop".freeze,
    ACC = "acc".freeze,
    JMP = "jmp".freeze,
  ].freeze

  Result = Struct.new(:acc_delta, :jump)

  attr_reader :operand

  def initialize(operand)
    @operand = operand
  end

  def ==(other)
    self.class == other.class && self.operand == other.operand
  end

  def execute
    raise NotImplementedError
  end

  def self.create(op, operand)
    case op
    when ACC
      Acc.new(operand)
    when JMP
      Jmp.new(operand)
    when NOP
      Nop.new(operand)
    end
  end
end

class Nop < Instruction
  def execute
    Instruction::Result.new(0, 1)
  end
end

class Acc < Instruction
  def execute
    Instruction::Result.new(@operand, 1)
  end
end

class Jmp < Instruction
  def execute
    Instruction::Result.new(0, @operand)
  end
end
