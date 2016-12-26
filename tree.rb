# My question is, how Ruby represent a tree?
# I found some good answer here


class Tree
  attr_accessor :children, :value
  
  def initialize(v)
    @value = v
    @children = []
  end
end

t = Tree.new(7)
t.children << Tree.new(3)
t.children << Tree.new(11)

puts t.inspect

##<Tree:0x007fbd908aedc8 @value=7, @children=[#<Tree:0x007fbd908aea30 @value=3, @children=[]>, #<Tree:0x007fbd908ae918 @value=11, #@children=[]>]>