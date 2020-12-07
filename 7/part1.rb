def contains?(rules, container_color, color)
  return false unless rules[container_color]
  rules[container_color].include?(color) || rules[container_color].any? do |sub_container_color|
    contains?(rules, sub_container_color, color)
  end
end

def parse_input(input)
  {}.tap do |rules|
    input.split("\n").each do |line|
      container_color, containment_spec = line.split(" bags contain ")
      if containment_spec == "no other bags."
        contained_colors = []
      else
        contained_colors = containment_spec.split(", ").map { |color| /\d+ (.*) bag/.match(color).captures[0] }
      end
      rules[container_color] = contained_colors
    end
  end
end

def main
  rules = parse_input(File.open('./input.txt').read)
  puts(rules.keys.count do |color|
    contains?(rules, color, "shiny gold")
  end)
end

main if __FILE__ == $PROGRAM_NAME
