ACTIVE = '#'
Point = Struct.new("Point", :x, :y, :z)

def adjacencies(x, y, z, active_points)
  adj = 0
  (-1..1).each do |dx|
    (-1..1).each do |dy|
      (-1..1).each do |dz|
        next if [dx, dy, dz] == [0, 0, 0]
        adj += 1 unless active_points[Point.new(x+dx, y+dy, z+dz)].nil?
      end
    end
  end
  adj
end

def iterate(active_points)
  min_x = active_points.keys.min_by { |pt| pt.x }.x - 1
  max_x = active_points.keys.max_by { |pt| pt.x }.x + 1
  min_y = active_points.keys.min_by { |pt| pt.y }.y - 1
  max_y = active_points.keys.max_by { |pt| pt.y }.y + 1
  min_z = active_points.keys.min_by { |pt| pt.z }.z - 1
  max_z = active_points.keys.max_by { |pt| pt.z }.z + 1

  {}.tap do |new_active_points|
    (min_x..max_x).each do |x|
      (min_y..max_y).each do |y|
        (min_z..max_z).each do |z|
          pt = Point.new(x, y, z)
          active = active_points[pt] == ACTIVE
          adj = adjacencies(x, y, z, active_points)
          if adj == 3 || (active && adj == 2)
            new_active_points[pt] = ACTIVE
          end
        end
      end
    end
  end
end

def main
  rows = File.open('./input.txt').readlines
  points = {}.tap do |initial_points|
    rows.each_with_index do |row, y|
      row.chars.each_with_index do |cell, x|
        initial_points[Point.new(x, y, 0)] = ACTIVE if cell == ACTIVE
      end
    end
  end

  6.times do
    points = iterate(points)
  end

  puts points.keys.count
end

main if __FILE__ == $PROGRAM_NAME
