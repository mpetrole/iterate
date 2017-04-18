#This file will take input and send it to the main file. I do this for ease of unit testing in the future.
require_relative 'main'

#get input from the command line and push it to the main file for processing
url = ARGV[0]
it = Iterate.new(url)
it.construct
puts it.check