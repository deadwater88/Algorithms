require_relative 'heap'

def k_largest_elements(array, k)
  output = []
  heap = BinaryMinHeap.new {|a,b| a <=> b}
  k.times { heap.push(array.pop) }
  array.each do |num|
    if num >= heap.peek
      heap.store.push(num)
      heap.extract
    end
  end
  heap.store
end
