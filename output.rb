require 'pry'
require 'awesome_print'

require_relative 'table.rb'
require_relative 'robot.rb'

table = Table.new(5, 5)

ap table

robot = Robot.new

ap robot

table.place(robot, 0, 0)
table.place(robot, 2, 2)

ap table

table.place(Robot.new, 3, 3)
ap table

# table.move(robot, :NORTH)

ap table