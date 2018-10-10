# Number of Islands
# Go to Discuss
# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
#     Example 1:
#
#     Input:
#     11110
# 11010
# 11000
# 00000
#
# Output: 1
# Example 2:
#
#     Input:
#     11000
# 11000
# 00100
# 00011
#
# Output: 3

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  visited = {}
  count = 0
  land,sea = "1","0"
  queue = []
  i_max,j_max = grid.size,grid[0].size
  for i in (0...i_max)
    for j in (0...j_max)
      x = grid[i][j]
      if x == land
        # p visited
        unless visited[[i,j]]
          count+=1
          queue = [[i,j]]
          # puts queue
          until queue.empty? do
            a,b = queue.shift
            p visited,queue
            unless visited[[a,b]]
              visited[[a,b]] = count
              queue << [a-1,b] if a-1 >= 0 and grid[a-1][b] != sea
              queue << [a+1,b] if a+1 < i_max and grid[a+1][b] != sea
              queue << [a,b-1] if b-1 >= 0 and grid[a][b-1] != sea
              queue << [a,b+1] if b+1 < j_max and grid[a][b+1] != sea
            end
            # puts queue
          end
        end
      end
    end
  end
  count
end

grid_1 = [["1","1","1","1","0"],["1","1","0","0","0"],["1","1","0","0","0"],["0","0","0","0","0"]]

puts num_islands(grid_1)

grid_2 = [["1","1","1","1","0"],["1","1","0","0","0"],["1","1","0","0","1"],["0","0","0","0","0"]]

puts num_islands(grid_2)

# def island_bfs root_i,root_j,

