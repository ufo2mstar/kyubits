require_relative 'bin_tree_init'

class BinTree

  TAIL_STR = "└─"
  FORK_STR = "├─"
  PAD_STR = "│ "
  INDENT_STR = "  "

  def show_tree
    str_builder = []
    walk_tree_str @root, true, "", str_builder
    puts "\n#{str_builder.join("\n")}\n"
  end

  private
  def walk_tree_str node, is_tail_node, prefix, str_builder
    str_builder << "#{prefix} #{is_tail_node ? TAIL_STR : FORK_STR} #{node}"
    child_prefix_str = "#{prefix} #{is_tail_node ? INDENT_STR : PAD_STR}"
    if node.left and node.right
      walk_tree_str node.left, false, "#{child_prefix_str} L", str_builder
      walk_tree_str node.right, true, "#{child_prefix_str} R", str_builder
    else
      walk_tree_str node.left, true, "#{child_prefix_str} L", str_builder if node.left
      walk_tree_str node.right, true, "#{child_prefix_str} R", str_builder if node.right
    end
  end

end


