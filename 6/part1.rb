def count_answers(group)
  group.split.join.chars.uniq.count
end

def main
  answers = File.open('./input.txt').read.split("\n\n").map do |group|
    count_answers(group)
  end.sum
  puts answers
end

main if __FILE__ == $PROGRAM_NAME
