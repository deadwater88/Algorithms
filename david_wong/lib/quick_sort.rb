require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new{ | a,b | a <=> b }
    return if length <= 1
    pivot = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivot - start, &prc)
    QuickSort.sort2!(array, pivot + 1, length - pivot - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    return if length <= 1
    prc ||= Proc.new{ | a,b | a <=> b }
    pivot = start
    # debugger if start == 4
    (length- 1).times do |i|
      if prc.call(array[pivot], array[pivot + i + 1]) == 1
        array[start + 1], array[pivot + i + 1] = array[pivot + i + 1], array[start + 1]
        start += 1
      end
    end
    array[pivot], array[start] = array[start], array[pivot]

    return start
  end
end

# p QuickSort.sort2!([4,3,10,7,2,8, 1], 0, 6)

# p QuickSort.sort2!([1, 2, 3, 4, 5])
