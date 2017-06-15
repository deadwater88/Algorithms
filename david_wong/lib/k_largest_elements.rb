require_relative 'heap'

def k_largest_elements(array, k)
  output = []
  heap = BinaryMinHeap.new {|a,b| b <=> a}
  (array.length - k).times { heap.push(array.pop) }
  min = [k, heap.count].min
  while output.length < k
    p array
    p output
    p heap.store
    debugger
    if array.last >= heap.peek
      output.push(array.pop)
    else
      output.push(heap.extract(min))
    end
  end
  output
end
