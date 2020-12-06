def count_answers(group)
  group.split.join.chars.uniq.count
end

def main
  puts(File.open('./input.txt').read.split("\n\n").map do |group|
    count_answers(group)
  end.sum)
end

main if __FILE__ == $PROGRAM_NAME
