def next_number(turn:, num:, previous_turns:)
  if previous_turns[num]
    turn - previous_turns[num]
  else
    0
  end
end

def main
  previous_turns = { 8 => 1, 11 => 2, 0 => 3, 19 => 4, 1 => 5 }
  next_num = nil
  cur_num = 2
  (6..29_999_999).each do |turn|
    next_num = next_number(turn: turn, num: cur_num, previous_turns: previous_turns)
    previous_turns[cur_num] = turn
    cur_num = next_num
  end
  puts cur_num
end

main if __FILE__ == $PROGRAM_NAME
