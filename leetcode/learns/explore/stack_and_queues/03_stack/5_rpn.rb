# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  s = []
  res = 0
  tokens.each do |c|
    if c =~ /^[*+-\/]$/
      x = s.pop
      y = s.pop
      calc = "(#{y}.to_f)#{c}(#{x}.to_f)"
      p calc
      res = eval(calc)
      if res.to_i != res
        res = (res < 0 ? res.ceil : res.floor)
      end
      s.push res.to_s
    else
      s.push c
    end
    # p s
  end
  res.to_i
end

def calc y,x,c

end

tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
puts eval_rpn(tokens)


# @param {String[]} tokens
# @return {Integer}
def eval_rpn_best(tokens)
  arr = []
  opr = ['+', '-', '*','/']
  tokens.each do |token|
    if opr.include? token
      b = arr.pop
      a = arr.pop
      arr.push(result(a.to_i,b.to_i,token))
    else
      arr.push(token)
    end
  end
  arr.pop.to_i
end

def result(a,b,token)
  case token
    when "+"
      return a + b
    when "-"
      return a - b
    when "*"
      return a * b
    else
      sol = a.abs / b.abs
      if((a < 0 && b > 0) || (a >0 && b < 0) )
        sol = -sol
      end
      return sol
  end
end


# @param {String[]} tokens
# @return {Integer}
def eval_rpn_nextbest(tokens)
  stack = []
  while tokens != []
    s = tokens.shift
    if '+-*/'.include?(s)
      y = stack.shift
      x = stack.shift
      case s
        when '+'
          stack.unshift(x+y)
        when '-'
          stack.unshift(x-y)
        when '*'
          stack.unshift(x*y)
        when '/'
          stack.unshift((x.to_f/y).to_i)
      end
    else
      stack.unshift(s.to_i)
    end
  end
  stack.first
end


# @param {String[]} tokens
# @return {Integer}
def eval_rpn_thirdbest(tokens)
  operators = ["+", "-", "*", "/"]
  arr = []
  tokens.each do |el|
    if operators.include?(el)
      last = arr.pop.to_i
      second_to_last = arr.pop.to_i
      num_to_push = [second_to_last, last.to_f].reduce(el.to_sym)
      arr.push(num_to_push < 0 ? num_to_push.ceil : num_to_push.floor)
    else
      arr.push(el)
    end
  end

  arr[0].to_i
end
