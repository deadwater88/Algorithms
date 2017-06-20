require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  in_edges = {}
  result = []
  queue = vertices.select do |vertex|
    in_edges[vertex] = vertex.in_edges.length
    vertex.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.pop
    result.push(vertex)
    vertex.out_edges.map(&:to_vertex).each do |vertex|
      in_edges[vertex] -= 1
      queue.unshift(vertex) if in_edges[vertex] == 0
    end
  end
  in_edges.all?{|vertex,count| count == 0} ? result : []

end
