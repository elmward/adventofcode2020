require_relative './part1.rb'

def adjacencies(x, y, seat_map)
  max_x = seat_map[0].length - 1
  max_y = seat_map.length - 1
  [].tap do |adj|
    (-1..1).each do |direction_x|
      (-1..1).each do |direction_y|
        next if [direction_x, direction_y] == [0, 0]
        (1..seat_map.length).each do |delta|
          dx = direction_x * delta
          dy = direction_y * delta
          if x + dx < 0 || x + dx > max_x
            break
          elsif y + dy < 0 || y + dy > max_y
            break
          end
          unless seat_map[y+dy][x+dx] == FLOOR
            adj << seat_map[y+dy][x+dx]
            break
          end
        end
      end
    end
  end
end

def main
  seat_map = File.open('./input.txt').readlines.map { |line| line.chars }
  final_map = iterate_until_stable(seat_map, 5)

  puts final_map.map{ |row| row.count { |seat| seat == OCCUPIED } }.sum
end

main if __FILE__ == $PROGRAM_NAME
