def count_answers(group)
  group.join.chars.group_by { |answer| answer }.count { |answer, answers| answers.count == group.count }
end

def main
  puts(File.open('./input.txt').read.split("\n\n").map do |group|
    count_answers(group.split)
  end.sum)
end

main if __FILE__ == $PROGRAM_NAME
