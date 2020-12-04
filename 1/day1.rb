def audit(input)
  values = input.map{ |n| n.to_i }
  values.each_with_index do |n, i|
    values[i+1..-1].each do |x|
      if n + x == 2020
        return n * x
      end
    end
  end
end

def audit3(input)
  values = input.map { |n| n.to_i }
  values.each_with_index do |n, i|
    values[i+1..-1].each_with_index do |x, j|
      if n + x <= 2020
        values[j+1..-1].each do |y|
          return n * x * y if n + x + y == 2020
        end
      end
    end
  end
end

def main
  input = File.readlines('./input.txt')
  puts "audit: #{audit(input)}"
  puts "audit3: #{audit3(input)}"
end

main if __FILE__ == $PROGRAM_NAME
