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
  nxt = Marshal.load(Marshal.dump(cur))
  cur.each_with_index do |row, y|
    row.each_with_index do |seat, x|
      occupied = adjacencies(x, y, cur).count { |seat| seat == OCCUPIED }
      if seat == EMPTY && occupied == 0
        modified = true
        nxt[y][x] = OCCUPIED
      elsif seat == OCCUPIED && occupied >= max_occupancy
        modified = true
        nxt[y][x] = EMPTY
      end
    end
  end
  [nxt, modified]
end

def iterate_until_stable(cur, max_occupancy=4)
  modified = true
  until !modified
    cur, modified = iterate(cur, max_occupancy)
  end
  cur
end

def main
  seat_map = File.open('./input.txt').readlines.map { |line| line.chars }
  final_map = iterate_until_stable(seat_map)

  puts final_map.map{ |row| row.count { |seat| seat == OCCUPIED } }.sum
end

main if __FILE__ == $PROGRAM_NAME
