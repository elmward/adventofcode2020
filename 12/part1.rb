DIRECTIONS=[
  EAST=0,
  NORTH=1,
  WEST=2,
  SOUTH=3,
]

def main
  directions = File.open('./input.txt').readlines
  current_position = part1(directions)
  puts current_position[0].abs + current_position[1].abs
end

def part1(directions)
  current_direction = EAST
  current_position = [0, 0]

  directions.each do |direction|
    op, val = direction[0], direction[1..].to_i
    case op
    when -> (op) { op == 'E' || (op == 'F' && current_direction == EAST) }
      current_position[0] += val
    when -> (op) { op == 'W' || (op == 'F' && current_direction == WEST) }
        current_position[0] -= val
    when -> (op) { op == 'N' || (op == 'F' && current_direction == NORTH) }
        current_position[1] += val
    when -> (op) { op == 'S' || (op == 'F' && current_direction == SOUTH) }
        current_position[1] -= val
    when 'L'
      current_direction = DIRECTIONS[(current_direction + (val/90)) % 4]
    when 'R'
      current_direction = DIRECTIONS[current_direction - (val/90)]
    end
  end
  current_position
end

main if __FILE__ == $PROGRAM_NAME
