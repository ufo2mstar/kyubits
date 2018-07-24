mat = [(1..5).to_a, (6..10).to_a, (11..15).to_a]
p mat
p mat.size
p mat[0].size

def spiral_print mat
  return if mat.empty?
  rows = mat.size
  cols = mat[0].size
  # n, s, e, w = rows-1, rows-1, cols-1, cols-1

  e_min, e_max = 0, cols-1
  w_min, w_max = 0, cols-1
  n_min, n_max = 1, rows-1
  s_min, s_max = 0, rows-1

  total_rounds = rows * cols
  directions ={
      'e' => [],
      'w' => [],
      'n' => [],
      's' => [],
  }

  direction = 'e'

  res = []
  run=-> row, col {n = mat[row][col]; res << n; print "#{n} "}

  curr_row, curr_col = 0, 0
  for i in 1..total_rounds do
    case direction
      when 'e'
        run[curr_row, curr_col]
        if curr_col == e_max
          direction = 's'
          e_max-=1
          curr_row+=1
        else
          curr_col+=1
        end
      when 's'
        run[curr_row, curr_col]
        if curr_row == s_max
          direction = 'w'
          s_max-=1
          curr_col-=1
        else
          curr_row+=1
        end
      when 'w'
        run[curr_row, curr_col]
        if curr_col == w_min
          direction = 'n'
          w_min+=1
          curr_row-=1
        else
          curr_col-=1
        end
      when 'n'
        run[curr_row, curr_col]
        if curr_row == n_min
          direction = 'e'
          n_min+=1
          curr_col+=1
        else
          curr_row-=1
        end
    end
  end
  res
end
