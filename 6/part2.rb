def count_answers(group)
  group.join.chars.group_by { |answer| answer }.count { |_, answers| answers.count == group.count }
end

def main
  puts(File.foreach('./input.txt', "\n\n").map do |group|
    count_answers(group.split)
  end.sum)
end

main if __FILE__ == $PROGRAM_NAME
