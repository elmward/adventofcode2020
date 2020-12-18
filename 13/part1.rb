def earliest_departure(start_time, bus_id)
  (start_time/bus_id + 1) * bus_id
end

def main
  input = File.open('./input.txt').readlines
  start_time = input[0].to_i
  bus_ids = input[1].split(',').reject { |x| x == 'x' }.map(&:to_i)
  id, departure_time = bus_ids.map { |id| [id, earliest_departure(start_time, id)] }.min_by { |ids_and_departures| ids_and_departures[1] }
  puts id * (departure_time - start_time)
end

main if __FILE__ == $PROGRAM_NAME
