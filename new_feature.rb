#ruby 2.4

#check if directories or files are empty

Dir.empty?('empty_directory')      # => true
Dir.empty?('directory_with_files') # => false

File.empty?('contains_text.txt')   # => false
File.empty?('empty.txt')           # => true