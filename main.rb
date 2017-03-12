require './lib/robot'
require './lib/table'

STDOUT.flush
$stdout.print "Please enter commands. 'PLACE 3,4,NORTH MOVE MOVE RIGHT MOVE LEFT MOVE REPORT'\n"
command = gets.chomp
robot = Robot.new(Table.new(5,5))
robot.run_command(command)