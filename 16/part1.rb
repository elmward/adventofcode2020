def in_ranges?(num, *ranges)
  ranges.any?{ |range| range.include?(num) }
end

def process_rules(rules_section)
  [].tap do |ranges|
    rules_section.split("\n").each do |rule|
      low_1, high_1, low_2, high_2 = /.*: (.*)-(.*) or (.*)-(.*)/.match(rule).captures.map(&:to_i)
      ranges << (low_1..high_1)
      ranges << (low_2..high_2)
    end
  end
end

def main
  rules_section, my_ticket_section, other_tickets_section = File.open('./input.txt').read.split("\n\n")
  ranges = process_rules(rules_section)

  fields = other_tickets_section.split("\n")[1..].join(',')
  values = fields.split(',').map(&:to_i)
  puts values.select { |value| !in_ranges?(value, *ranges) }.sum
end

main if __FILE__ == $PROGRAM_NAME
