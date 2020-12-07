def count_answers(group)
  group.split.join.chars.uniq.count
end

def main
  puts(File.foreach('./input.txt', "\n\n").map do |group|
    count_answers(group)
  end.sum)
end

main if __FILE__ == $PROGRAM_NAME
