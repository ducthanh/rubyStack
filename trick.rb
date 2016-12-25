#_ underscore variable => unused value

[0,3,5,7,4,6,7,9].group_by.with_index{ |_, index| index % 4}

#
# => {0=>[0, 4], 1=>[3, 6], 2=>[5, 7], 3=>[7, 9]}

# => load path
$: or $LOAD_PATH

class ShoppingList
  attr_accessor :items

  def initialize(*items)
    @item = items
  end

  def in
    @item
  end
end

a = ShoppingList.new(12,3,4,5,5)

puts a.in.inspect
# => [12, 3, 4, 5, 5]


#Logger
require 'logger'


logger = Logger.new(STDOUT)

# determine the log level
logger.level = Logger::INFO

logger.debug("Created logger")
logger.info("Program started")

logger.warn("Nothing to do!")
logger.error "Argument #{@foo} mismatch."
logger.add(Logger::FATAL) { 'Fatal error!' }
logger.debug("this is debug")

email = "log info"

logger.info(email)


path = "a_non_existent_file"

# (\w+)? and (\w*) (0..+inf word characters)

begin 
  File.foreach(path) do |line|
    unless line =~ /^(\w+)$/
      logger.error("Line in wrong format: #{line.chomp}")
    end
  end
rescue => err
  logger.fatal("Caught exception; existing")
  logger.fatal(err)
end

# Kernel gets

# gets
