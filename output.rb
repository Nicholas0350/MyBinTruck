require 'pry'
require 'awesome_print'
require 'test/unit'

extend Test::Unit::Assertions

require_relative 'table.rb'
require_relative 'robot.rb'

table = Table.new(5, 5)

robot = Robot.new

table.place(robot, 0, 0)
assert_equal 0, robot.x, "robot is on the first row"
assert_equal 0, robot.y, "robot is on the first column"

table.place(robot, 2, 2)
assert_equal 2, robot.x, "robot is on the 3rd row"
assert_equal 2, robot.y, "robot is on the 3rd column"

assert_equal 1, table.robots.size, "there should only be 1 robot"

other_robot = Robot.new
table.place(other_robot, 3, 3)

assert_equal 3, other_robot.x, "other robot is on the 4th row"
assert_equal 3, other_robot.y, "other robot is on the 4th column"

assert_equal 2, table.robots.size, "there should be 2 robots on the table"

table.move(robot, :NORTH)
assert_equal 2, robot.x, "x statys the same"
assert_equal 1, robot.y, "the robot moves up 1"

table.move(robot, :SOUTH)
assert_equal 2, robot.x, "x statys the same"
assert_equal 2, robot.y, "the robot moves down 1"

table.move(robot, :EAST)
assert_equal 3, robot.x, "the robot moves right 1"
assert_equal 2, robot.y, "y stays the same"

table.move(robot, :WEST)
assert_equal 2, robot.x, "the robot moves left 1"
assert_equal 2, robot.y, "y stays the same"

table.place(robot, 0, 0)
table.move(robot, :WEST)
assert_equal 0, robot.x, "it should not fall off"
assert_equal 0, robot.y, "it should not fall off"
table.move(robot, :NORTH)
assert_equal 0, robot.x, "it should not fall off"
assert_equal 0, robot.y, "it should not fall off"

table.place(robot, 4, 4)
table.move(robot, :EAST)
assert_equal 4, robot.x, "it should not fall off"
assert_equal 4, robot.y, "it should not fall off"
table.move(robot, :SOUTH)
assert_equal 4, robot.x, "it should not fall off"
assert_equal 4, robot.y, "it should not fall off"

puts "All Tests Pass :)"