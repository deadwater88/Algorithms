
require_relative './binary_search_tree.rb'

def kth_largest(tree_node, k, node = {correct: nil, count: 0})
  return if tree_node.nil? || node[:correct]
  kth_largest(tree_node.right, k, node)
  node[:correct] = tree_node if k == (node[:count] += 1)
  kth_largest(tree_node.left, k, node)
  node[:correct]
end
