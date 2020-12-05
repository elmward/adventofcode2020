require_relative './part1.rb'

describe "required_fields_present?" do
  let(:passport) do
    {
      byr: 'foo',
      iyr: 'foo',
      eyr: 'foo',
      hgt: 'foo',
      hcl: 'foo',
      ecl: 'foo',
      pid: 'foo',
      cid: 'foo',
    }
  end

  it "considers a passport with all fields valid" do
    expect(required_fields_present?(passport)).to eq true
  end

  it "considers a passport missing only cid valid" do
    passport.delete(:cid)
    expect(required_fields_present?(passport)).to eq true
  end

  it "considers a passport missing other fields invalid" do
    fields = passport.keys
    fields.delete(:cid)
    passport.delete(fields.shuffle.first)
    expect(required_fields_present?(passport)).to eq false
  end
end

describe "create_passport" do
  let (:input) do
    <<~HERE
    hcl:#ae17e1 iyr:2013
    eyr:2024
    ecl:brn pid:760753108 byr:1931
    hgt:179cm
    HERE
  end

  it "creates a passport from the given input" do
    expect(create_passport(input)).to eq(
      hcl: "#ae17e1",
      iyr: "2013",
      eyr: "2024",
      ecl: "brn",
      pid: "760753108",
      byr: "1931",
      hgt: "179cm",
    )
  end
end
