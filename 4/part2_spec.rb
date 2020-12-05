require_relative './part2.rb'

describe "field validations" do
  describe "valid_birth_year?" do
    it "is true if between 1920 and 2002, inclusive" do
      expect(valid_birth_year?(1920)).to eq true
      expect(valid_birth_year?(1945)).to eq true
      expect(valid_birth_year?(2002)).to eq true
    end

    it "is false if before 1920" do
      expect(valid_birth_year?(1919)).to eq false
    end

    it "is false if after 2002" do
      expect(valid_birth_year?(2003)).to eq false
    end
  end

  describe "valid_issue_year?" do
    it "is true if between 2010 and 2020, inclusive" do
      expect(valid_issue_year?(2010)).to eq true
      expect(valid_issue_year?(2015)).to eq true
      expect(valid_issue_year?(2020)).to eq true
    end

    it "is false if before 2010" do
      expect(valid_issue_year?(2009)).to eq false
    end

    it "is false if after 2020" do
      expect(valid_issue_year?(2021)).to eq false
    end
  end

  describe "valid_expiration_year?" do
    it "is true if between 2020 and 2030, inclusive" do
      expect(valid_expiration_year?(2020)).to eq true
      expect(valid_expiration_year?(2025)).to eq true
      expect(valid_expiration_year?(2030)).to eq true
    end

    it "is false if before 2020" do
      expect(valid_expiration_year?(2019)).to eq false
    end

    it "is false if after 2030" do
      expect(valid_expiration_year?(2031)).to eq false
    end
  end

  describe "valid_height?" do
    it "is true if it is a number of cm between 150 and 193, inclusive" do
      expect(valid_height?("150cm")).to eq true
      expect(valid_height?("175cm")).to eq true
      expect(valid_height?("193cm")).to eq true
    end

    it "is false if it is a number of cm less than 150" do
      expect(valid_height?("149cm")).to eq false
    end

    it "is false if it is a number of cm greater than 193" do
      expect(valid_height?("194cm")).to eq false
    end

    it "is true if it is a number of in between 59 and 76, inclusive" do
      expect(valid_height?("59in")).to eq true
      expect(valid_height?("64in")).to eq true
      expect(valid_height?("76in")).to eq true
    end

    it "is false if it is a number of in less than 59" do
      expect(valid_height?("58in")).to eq false
    end

    it "is false if it is a number of in greater than 76" do
      expect(valid_height?("77in")).to eq false
    end

    it "is false if it is not a number" do
      expect(valid_height?("foo")).to eq false
    end

    it "is false if it does not have a unit" do
      expect(valid_height?("173")).to eq false
    end

    it "is false if empty" do
      expect(valid_height?("")).to eq false
    end
  end

  describe "valid_hair_color?" do
    it "is true if it is a hexadecimal literal" do
      expect(valid_hair_color?("#ff0033")).to eq true
    end

    it "is false if it is not a hexadecimal literal" do
      expect(valid_hair_color?("foo")).to eq false
      expect(valid_hair_color?("#zzzzzz")).to eq false
      expect(valid_hair_color?("ff0033")).to eq false
    end
  end

  describe "valid_eye_color?" do
    let(:valid_colors) { %w(amb blu brn gry grn hzl oth) }

    it "is true if it is one of the acceptable values" do
      expect(valid_colors.all? { |color| valid_eye_color?(color) }).to eq true
    end

    it "is false if it is not one of the acceptable values" do
      expect(valid_eye_color?("foo")).to eq false
    end
  end

  describe "valid_passport_id?" do
    it "is true if it is a nine-digit number" do
      expect(valid_passport_id?("123456789")).to eq true
      expect(valid_passport_id?("000012345")).to eq true
    end

    it "is false if it is not a number" do
      expect(valid_passport_id?("foo")).to eq false
    end

    it "is false if it is not a nine-digit number" do
      expect(valid_passport_id?("123")).to eq false
    end

    it "is false if it is bigger than a nine-digit number" do
      expect(valid_passport_id?("1234567890")).to eq false
    end
  end
end

describe "valid_passport?" do
  let(:valid_passports) do
    [
      {
        pid: "087499704",
        hgt: "74in",
        ecl: "grn",
        iyr: "2012",
        eyr: "2030",
        byr: "1980",
        hcl: "#623a2f"
      },
      {
        eyr: "2029",
        ecl: "blu",
        cid: "129",
        byr: "1989",
        iyr: "2014",
        pid: "896056539",
        hcl: "#a97842",
        hgt: "165cm",
      },
      {
        hcl: "#888785",
        hgt: "164cm",
        byr: "2001",
        iyr: "2015",
        cid: "88",
        pid: "545766238",
        ecl: "hzl",
        eyr: "2022",
      },
      {
        iyr: "2010",
        hgt: "158cm",
        hcl: "#b6652a",
        ecl: "blu",
        byr: "1944",
        eyr: "2021",
        pid: "093154719",
      }
    ]
  end

  let(:invalid_passports) do
    [
      {
        eyr: "1972",
        cid: "100",
        hcl: "#18171d",
        ecl: "amb",
        hgt: "170",
        pid: "186cm",
        iyr: "2018",
        byr: "1926",
      },
      {
        iyr: "2019",
        hcl: "#602927",
        eyr: "1967",
        hgt: "170cm",
        ecl: "grn",
        pid: "012533040",
        byr: "1946",
      },
      {
        hcl: "dab227",
        iyr: "2012",
        ecl: "brn",
        hgt: "182cm",
        pid: "021572410",
        eyr: "2020",
        byr: "1992",
        cid: "277",
      },
      {
        hgt: "59cm",
        ecl: "zzz",
        eyr: "2038",
        hcl: "74454a",
        iyr: "2023",
        pid: "3556412378",
        byr: "2007",
      },
      {
        iyr: "2010",
        hgt: "158cm",
        hcl: "#b6652a",
        ecl: "blu",
        eyr: "2021",
        pid: "093154719",
      }
    ]
  end

  it "is true when all present fields are valid" do
    expect(valid_passports.all? { |pp| valid_passport?(pp) } )
  end

  it "is false when any field is invalid or missing" do
    expect(invalid_passports.all? { |pp| valid_passport?(pp) }).to eq false
  end
end
