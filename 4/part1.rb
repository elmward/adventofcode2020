REQUIRED_FIELDS = %i[
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
]

def required_fields_present?(passport)
  REQUIRED_FIELDS.all? { |field_name| passport.keys.include?(field_name) }
end

def create_passport(input)
  input.split.reduce({}) do |acc, token|
    key, value = token.split(':')
    acc[key.to_sym] = value
    acc
  end
end

def main
  passports = File.open('./input.txt').read.split("\n\n").map { |input| create_passport(input) }
  puts passports.count { |passport| required_fields_present?(passport) }
end

main if __FILE__ == $PROGRAM_NAME
