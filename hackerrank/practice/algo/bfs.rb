# CASES = gets.chomp
#
# CASES.times {
#   NODES, EDGES = gets.chomp.split
#   EDGES.times {
#
#   }
# }
#
# The next lines each consist of two space separated integers, where and denote the two nodes between which the edge exists.
#     The last line of a testcase has an integer, denoting the starting position.
#
#         Constraints
#
#
# Output Format
#
# def all_paths from, dest
#   all_list = (@nav_doc.keys+@nav_doc.values).flatten.uniq
#   @limit = all_list.size
#   parents = {}
#   step = 0
#   levels = {'0' => from}
#   front = [from]
#   done_list =ans= []
#   until front.empty?
#     step += 1
#     next_front = []
#     levels[step.to_s] = []
#     front.each { |page|
#       foll_list = @nav_doc[page]
#       if foll_list
#         foll_list.each { |next_page|
#           unless done_list.include? next_page
#             done_list << next_page
#             next_front << next_page
#             levels[step.to_s] << next_page
#             parents[next_page] = page
#             done_list.uniq!
#           end
#         }
#       end
#     }
#     done_list += front
#     if levels[step.to_s].include? dest
#       # puts "cutting\n#{parents}"
#       ans = make_path(dest, from, parents); break
#     end
#     # done_list.uniq!
#     # next_front.uniq!
#     # print "done - #{done_list}\n"
#     # todo: make the next_front properly filter out visited nodes
#     front = next_front
#     # print "#{front}\n"
#     raise "\noverlooping! #{from} -> #{dest}" if step > @limit
#   end
#   # yp parents
#   # yp levels
#   # yp ans
#   p "\nSorry, no paths from  #{from} -> #{dest}" if ans.empty?
#   [ans]
# end