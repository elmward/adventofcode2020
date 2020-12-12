EMPTY = 'L'
OCCUPIED = '#'
FLOOR = '.'
MAX_OCCUPANCY = 4

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

def iterate(cur)
  modified = false
  nxt = Marshal.load(Marshal.dump(cur))
  cur.each_with_index do |row, y|
    row.each_with_index do |seat, x|
      occupied = adjacencies(x, y, cur).count { |seat| seat == OCCUPIED }
      if seat == EMPTY && occupied == 0
        modified = true
        nxt[y][x] = OCCUPIED
      elsif seat == OCCUPIED && occupied >= MAX_OCCUPANCY
        modified = true
        nxt[y][x] = EMPTY
      end
    end
  end
  [nxt, modified]
end

def iterate_until_stable(cur)
  modified = true
  until !modified
    nxt, modified = iterate(cur)
    cur = nxt
  end
  cur
end

def main
  cur = File.open('./input.txt').readlines.map { |line| line.chars }
  modified = true
  runs = 0
  until !modified
    nxt, modified = iterate(cur)
    cur = nxt
    runs += 1
  end

  puts cur.map{ |row| row.count { |seat| seat == OCCUPIED } }.sum
end

main if __FILE__ == $PROGRAM_NAME
