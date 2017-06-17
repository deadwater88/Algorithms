
require_relative './binary_search_tree.rb'

def kth_largest(tree_node, k, count = {count: 0})
  return if tree_node.nil?
  kth_largest(tree_node.right, k, count)
  return tree_node.right if k == count[:count]
  count[:count] += 1
  kth_largest(tree_node.left, k, count)
end
