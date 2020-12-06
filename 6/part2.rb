def count_answers(group)
  people = group.split
  counted_answers = people.reduce({}) do |acc, answers|
    answers.chars.uniq.each do |char|
      if acc[char]
        acc[char] += 1
      else
        acc[char] = 1
      end
    end
    acc
  end

  counted_answers.map do |answer, count|
    count == people.count ? 1 : 0
  end.sum
end

def main
  answers = File.open('./input.txt').read.split("\n\n").map do |group|
    count_answers(group)
  end.sum
  puts answers
end

main if __FILE__ == $PROGRAM_NAME
