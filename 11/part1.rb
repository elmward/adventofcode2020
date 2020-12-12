EMPTY = 'L'
OCCUPIED = '#'
FLOOR = '.'

def adjacencies(x, y, seat_map)
  max_x = seat_map[0].length - 1
  max_y = seat_map.length - 1
  [].tap do |adj|
    (-1..1).each do |dx|
      next if x + dx < 0 || x + dx > max_x
      (-1..1).each do |dy|
        next if y + dy < 0 || y + dy > max_y
        next if [dx, dy] == [0, 0]
        adj << seat_map[y+dy][x+dx]
      end
    end
  end
end

def iterate(cur, max_occupancy=4)
  modified = false
  cur.each_with_index do |row, y|
    row.each_with_index do |seat, x|
      occupied = adjacencies(x, y, cur).count { |seat| occupied?(seat) }
      if seat == EMPTY && occupied == 0
        modified = true
        cur[y][x] = [EMPTY, OCCUPIED]
      elsif seat == OCCUPIED && occupied >= max_occupancy
        modified = true
        cur[y][x] = [OCCUPIED, EMPTY]
      end
    end
  end
  cur = cur.map do |row|
    row.map { |seat| seat.is_a?(Array) ? seat[1] : seat }
  end
  [cur, modified]
end

def occupied?(seat)
  seat == OCCUPIED || (seat.is_a?(Array) && seat[0] == OCCUPIED)
end

def iterate_until_stable(seat_map, max_occupancy=4)
  modified = true
  until !modified
    seat_map, modified = iterate(seat_map, max_occupancy)
  end
  seat_map
end

def main
  seat_map = File.open('./input.txt').readlines.map { |line| line.chars }
  final_map = iterate_until_stable(seat_map)

  puts final_map.map{ |row| row.count { |seat| seat == OCCUPIED } }.sum
end

main if __FILE__ == $PROGRAM_NAME
