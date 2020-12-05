require_relative './part1.rb'

def valid_birth_year?(byr)
  (1920..2002).include?(byr.to_i)
end

def valid_issue_year?(iyr)
  (2010..2020).include?(iyr.to_i)
end

def valid_expiration_year?(eyr)
  (2020..2030).include?(eyr.to_i)
end

def valid_height?(hgt)
  matches = /(\d{2,3})(in|cm)/.match(hgt)
  return false unless matches

  height, unit = matches[1].to_i, matches[2]
  if unit == "cm"
    (150..193).include?(height)
  else
    (59..76).include?(height)
  end
end

def valid_hair_color?(hcl)
  /#[0-9a-f]{6}/.match?(hcl)
end

def valid_eye_color?(ecl)
  %w(amb blu brn gry grn hzl oth).include?(ecl)
end

def valid_passport_id?(pid)
  /\A\d{9}\z/.match?(pid)
end

def valid_passport?(passport)
  return false unless required_fields_present?(passport)
  [
    valid_birth_year?(passport[:byr]),
    valid_issue_year?(passport[:iyr]),
    valid_expiration_year?(passport[:eyr]),
    valid_height?(passport[:hgt]),
    valid_hair_color?(passport[:hcl]),
    valid_eye_color?(passport[:ecl]),
    valid_passport_id?(passport[:pid]),
  ].all?
end

def main
  passports = File.open('./input.txt').read.split("\n\n").map { |input| create_passport(input) }
  puts passports.count { |passport| valid_passport?(passport) }
end

main if __FILE__ == $PROGRAM_NAME
