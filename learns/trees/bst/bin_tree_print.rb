require_relative 'bin_tree_init'

class BinTree

  TAIL_STR = "└─"
  FORK_STR = "├─"
  PAD_STR = "│ "
  INDENT_STR = "  "

  def show_tree
    str_builder = []
    walk_tree_str @root, true, "", str_builder, 0
    puts "\n#{str_builder.join("\n")}\n"
  end

  private
  def walk_tree_str node, is_tail_node, prefix, str_builder, i
    str_builder << "#{prefix} #{is_tail_node ? TAIL_STR : FORK_STR} #{node} [#{i}]"
    child_prefix_str = "#{prefix} #{is_tail_node ? INDENT_STR : PAD_STR}"
    left_i, right_i = (2*i)+1, (2*i)+2
    if node.left and node.right
      walk_tree_str node.left, false, "#{child_prefix_str} L [#{left_i}]", str_builder, left_i
      walk_tree_str node.right, true, "#{child_prefix_str} R [#{right_i}]", str_builder, right_i
    else
      walk_tree_str node.left, true, "#{child_prefix_str} L [#{left_i}]", str_builder, left_i if node.left
      walk_tree_str node.right, true, "#{child_prefix_str} R [#{right_i}]", str_builder, right_i if node.right
    end
  end

end


