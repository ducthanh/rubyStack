#_ underscore variable => unused value

[0,3,5,7,4,6,7,9].group_by.with_index{ |_, index| index % 4}

#
# => {0=>[0, 4], 1=>[3, 6], 2=>[5, 7], 3=>[7, 9]}

# => load path
$: or $LOAD_PATH

class ShoppingList
  attr_reader :items

  def initialize(*items)
    @item = items
  end
end