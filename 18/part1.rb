def do_math(input)
  total = nil
  op = nil

  i = 0
  while i < input.chars.count
    tok = input.chars[i]
    if tok != ' '
      if ['*', '+'].include?(tok)
        op = tok
      elsif tok == '('
        subexp = subexpression(input, i)
        if op == '*'
          total *= do_math(subexp)
        elsif op == '+'
          total += do_math(subexp)
        end
        i += subexp.length + 1
      elsif total == nil
        total = tok.to_i
      elsif op == '*'
        total *= tok.to_i
      else
        total += tok.to_i
      end
    end
    i += 1
  end
  total
end

def subexpression(input, start_index)
  i = start_index
  while i < input.chars.count
    tok = input.chars[i]
    if tok != ' ' && tok == '('
      j = i
      j += 1 until input.chars[j] != '('
      nesting_depth = j - i
      close_parens = 0
      until close_parens == nesting_depth
        j += 1
        case input.chars[j]
        when ')'
          close_parens += 1
        when '('
          nesting_depth += 1
        end
      end
      i = j
    end
    i += 1
  end
  input[start_index+1..j-1]
end

def main
  puts(File.readlines('./input.txt').map do |line|
    do_math(line.rstrip)
  end.sum)
end

main if __FILE__ == $PROGRAM_NAME
