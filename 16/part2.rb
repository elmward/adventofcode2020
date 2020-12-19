require_relative './part1.rb'

def eligible_rules(val, rules)
  if val.is_a? Array
    rules = val.map { |val| eligible_rules(val, rules) }
    rules[0].intersection(*rules[1..])
  else
    rules.keys.select { |name| in_ranges?(val, *rules[name]) }
  end
end

def process_rules(rules_section)
  {}.tap do |rules|
    rules_section.split("\n").each do |rule|
      name, low_1, high_1, low_2, high_2 = /(.*): (.*)-(.*) or (.*)-(.*)/.match(rule).captures
      rules[name] = [(low_1.to_i..high_1.to_i), (low_2.to_i..high_2.to_i)]
    end
  end
end

def main
  rules_section, my_ticket_section, other_tickets_section = File.open('./input.txt').read.split("\n\n")
  rules = process_rules(rules_section)

  tickets = other_tickets_section.split("\n")[1..].map { |ticket_line| ticket_line.split(',').map(&:to_i) }
  valid_tickets = tickets.reject { |ticket| ticket.any? { |val| eligible_rules(val, rules).empty? } }
  field_values = (0..valid_tickets[0].count - 1).map { |i| [i, valid_tickets.map { |ticket| ticket[i] }] }
  possible_rules = field_values.map { |i, values| [i, eligible_rules(values, rules)] }
  sorted_rules = possible_rules.sort_by { |i, rules| rules.count }

  assigned_rules = []
  field_rules = sorted_rules.map do |field_number, rule_names|
    if rule_names.count > 1
      rule_names = rule_names - assigned_rules
    end
    assigned_rules << rule_names[0]
    [field_number, rule_names[0]]
  end.sort_by { |field_number, _| field_number }

  my_ticket = my_ticket_section.split("\n")[1]
  my_ticket = my_ticket.split(",").map(&:to_i)
  departure_rules = field_rules.select { |_, name| name.start_with?("departure") }
  departure_rule_fields = departure_rules.map { |field_num, _| field_num }
  puts my_ticket.each_with_index.reduce(1) { |acc, (val, i)| departure_rule_fields.include?(i) ? acc *= val : acc }
end

main if __FILE__ == $PROGRAM_NAME
