require_relative './part1.rb'

def main
  input = File.open('./input.txt').readlines
  schedule = bus_schedule(input[1].strip.split(','))
  puts find_first_valid_departure(schedule)
end

def bus_schedule(input)
  input.each_with_index.reduce([]) do |sched, (elt, i)|
    sched << [elt.to_i, i] unless elt == 'x'
    sched
  end
end

def find_first_valid_departure(schedule)
  start_time = 0
  incr = 1

  schedule.each do |bus_id, dt|
    until (start_time + dt) % bus_id == 0
      start_time += incr
    end
    incr *= bus_id
  end
  start_time
end

main if __FILE__ == $PROGRAM_NAME
