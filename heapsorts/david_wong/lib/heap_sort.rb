require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new(self) { |b, a| (a <=> b) }
    (1...length).each { |i| heap._push(i) }
    (length - 1).downto(1) { |i| heap._extract(i) }
  end
end
