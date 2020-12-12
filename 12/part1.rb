DIRECTIONS=[
  EAST=0,
  NORTH=1,
  WEST=2,
  SOUTH=3,
]

def main
  directions = File.open('./input.txt').readlines
  # current_position = part1(directions)
  # puts current_position[0].abs + current_position[1].abs
  current_position = part2(directions)
  puts current_position[0].abs + current_position[1].abs
end

def part1(directions)
  current_direction = EAST
  current_position = [0, 0]

  directions.each do |direction|
    op, val = direction[0], direction[1..].to_i
    case op
    when 'F'
      case current_direction
      when EAST
        current_position[0] += val
      when WEST
        current_position[0] -= val
      when NORTH
        current_position[1] += val
      when SOUTH
        current_position[1] -= val
      end
    when 'L'
      current_direction = DIRECTIONS[(current_direction + (val/90)) % 4]
    when 'R'
      current_direction = DIRECTIONS[current_direction - (val/90)]
    when 'E'
      current_position[0] += val
    when 'W'
      current_position[0] -= val
    when 'N'
      current_position[1] += val
    when 'S'
      current_position[1] -= val
    end
  end
  current_position
end

def part2(directions)
  ship_position = [0, 0]
  dx, dy = 10, 1

  directions.each do |direction|
    op, val = direction[0], direction[1..].to_i
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
      ship_position = [ship_position[0] + (dx*val), ship_position[1] + (dy*val)]
    when 'E'
      dx += val
    when 'W'
      dx -= val
    when 'N'
      dy += val
    when 'S'
      dy -= val
    end
  end
  ship_position
end

main if __FILE__ == $PROGRAM_NAME
