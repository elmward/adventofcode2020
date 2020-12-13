def main
  x, y = 0, 0
  dx, dy = 10, 1
  File.foreach('./input.txt') do |direction|
    op, val = direction[0], direction[1..].to_i
    x, y, dx, dy = navigate(x, y, dx, dy, op, val)
  end
  puts x.abs + y.abs
end

def navigate(x, y, dx, dy, op, val)
  case op
  when 'L'
    (val/90).times do
      dx, dy = [-dy, dx]
    end
  when 'R'
    (val/90).times do
      dx, dy = [dy, -dx]
    end
  when 'F'
    x, y = [x + (dx*val), y + (dy*val)]
  when 'E'
    dx += val
  when 'W'
    dx -= val
  when 'N'
    dy += val
  when 'S'
    dy -= val
  end
  [x, y, dx, dy]
end

main if __FILE__ == $PROGRAM_NAME
