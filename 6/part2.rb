def count_answers(group)
  # this assumes everyone answers each question at most once
  group.join.chars.sort.chunk_while do |current, subsequent|
    current == subsequent
  end.count { |answers| answers.count == group.count }
end

def main
  answers = File.open('./input.txt').read.split("\n\n").map do |group|
    count_answers(group.split)
  end.sum
  puts answers
end

main if __FILE__ == $PROGRAM_NAME
