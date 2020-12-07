def bags_contained(rules, color)
  rules[color].map do |rule|
    rule[:num] + (rule[:num] * bags_contained(rules, rule[:color]))
  end.sum
end

def parse_input(input)
  {}.tap do |rules|
    input.split("\n").each do |line|
      container_color, containment_spec = line.split(" bags contain ")
      if containment_spec == "no other bags."
        contained_colors = []
      else
        contained_colors = containment_spec.split(", ").map do |color|
          captures = /(\d+) (.*) bag/.match(color).captures
          num, color = captures[0].to_i, captures[1]
          {num: num, color: color}
        end
      end
      rules[container_color] = contained_colors
    end
  end
end

def main
  rules = parse_input(File.open('./input.txt').read)
  puts(bags_contained(rules, "shiny gold"))
end

main if __FILE__ == $PROGRAM_NAME
