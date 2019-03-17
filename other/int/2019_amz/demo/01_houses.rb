def cellCompete(states, days)
  days.times do |d|
    states = compute_next_day states
  end
  states
end

def compute_next_day states
  n = states.size-1
  new_state = states.dup
  states.each_with_index{ |s,i|
    if i==0
      new_state[i] = rule 0, states[i+1]
    elsif i == n
      new_state[i] = rule states[i-1], 0
    else
      new_state[i] = rule states[i-1], states[i+1]
    end
  }
  new_state
end

def rule left, right
  left == right ? 0:1
end

s = [1,0,0,0,0,1,0,0]
p cellCompete s,1
