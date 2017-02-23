# @ https://learnrubythehardway.org/book/ex44.html
#

# Implicit Inheritance

class Parent
  def implicit()
    puts "PARENT implicit()"
  end
end

class Child < Parent
end

dad = Parent.new
son = Child.new

dad.implicit()
son.implicit()


#Override Explicitly

class Parent1
  def override()
    puts "PARENT override()"
  end
end

class Child1 < Parent1
  def override()
    puts "CHILD override()"
  end
end

dad = Parent1.new
son = Child1.new

dad.override
son.override


#Alter Before or After

class Parent2
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

# using super() with initialize

class Child3 < Parent
  def initialize(stuff)
    @stuff = stuff
    super()
  end
end

## COMPOSITION

class Order
  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def altered()
    puts "OTHER altered()"
  end
end

# not a parent-child relationship
# has-a relationship
# child has-a Other that it uses to get work done
# can simplify by make Other become module
class Child
  def initialize()
    @other = Order.new()
  end

  def implicit
    @other.implicit
  end

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    @other.altered
    puts "CHILD, AFTER OTHER altered()"
  end
end

module Other
  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def Other.altered()
    puts "OTHER altered()"
  end
end

class Child
  include Other

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    Other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end

son = Child.new()
son.implicit()
son.override()
son.altered()



