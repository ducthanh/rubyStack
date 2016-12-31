# tutorial by sitepoint
# Problem:
# Have too many emails, in an example where we're managed to assign every email in our inbox a priority or a key value
# we want: 
#
# Get the email with the largest key
# Remove and get the email with the largest key

#     10
#    /  \
#   4    8
#  /|    | 
# 2 1    7
# for any node, the children of that node have keys smaller than or equal to that of the node
# => HEAP are actually stored as arrays
# => [10, 4, 8, 2, 1, 7]


# pseudocode 

#     fix_one_error(array, index)
# 1.  If array[index] is a leaf node or is greater that both its children, return
# 2.  larger_index = the index of the larger child of the node at array[index]
# 3.  Swap array[i] and array[larger_index]
# 4.  fix_one_error(array, larger_index)

class Heap
  attr_accessor :heap_size, :array_rep
  
  def left_child(index)
    2*index + 1
  end
  
  def right_child(index)
    2*index + 2
  end
  
  def left_child_key(index)
    @array_rep[left_child(index)]
  end
  
  def right_child_key(index)
    @array_rep[right_child(index)]
  end
  
  # check if a given element is a leaf node or not
  
  def leaf_node?(index)
    return index >= @heap_size/2
  end
  
  # tell if a node already satisfies the max heap property
  
  def satisfied?(index)
    @array_rep[index] >= left_child_key(index) and
    @array_rep[index] >= right_child_key(index)
  end
  
  def fix_one_error(index)
    return if leaf_node?(index) || satisfied?(index)
    
    left_child_key = @array_rep[left_child(index)]
    right_child_key = @array_rep[right_child(index)]
    
    larger_child = if left_child_key > right_child_key then left_child(index)
    else right_child(index) end
      
      @array_rep[index], @array_rep[larger_child] = @array_rep[larger_child],
      @array_rep[index]
      
      fix_one_error(larger_child)
  end
    
  def create_max_heap
    (0..@heap_size/2-1).to_a.reverse.each do |index|
      fix_one_error(index)
    end
  end
  
  def get_max
    #because it's a max heap ;)
    array_rep[0]
  end
  
  def get_and_remove_max
    
    array_rep[@heap_size-1], array_rep[0] = array_rep[0], array_rep[@heap_size-1] # everything aside from the new first element still satisfies the max heap property
    @heap_size -= 1
    fix_one_error(0)
  end
    
end
  
  
  
  