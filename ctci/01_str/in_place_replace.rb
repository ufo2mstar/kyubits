
def replace str
  len = str.length
  i = 0
  push=-> push_i {
    local_i = len-push_i
    local_len = len
    while local_i>0
      str[local_len-1] = str[local_len-3]
      local_len-=1
      local_i-=1
    end
  }
  while i < len do
    char = str[i]
    if char == " "
      push[i+1]
      str[i]="%"
      str[i+1]="2"
      str[i+2]="0"
      i+=3
    else
      i+=1
    end
  end
  str
end

input = "a b  "
input = "mr john smith    "

p replace input