# frozen_string_literal: true

require 'test/unit/assertions'
include Test::Unit::Assertions

class Robot
  attr_reader :column, :row

  def place(column, row)
    @column = column
    @row = row
    [@column, @row]
  end

  def roam(direction)
    if direction == "NORTH"
      @row = row - 1
    elsif direction == "SOUTH"
      @row = row + 1
    end
    direction
  end
end

assert_equal Robot, Robot, 'Shuld eb able to find the Robot class'
robot = Robot.new
assert_equal robot.respond_to?(:roam), true, 'Robot should be able to roam'
assert_equal robot.respond_to?(:place), true, 'Robot should be able to be placed'

expected_answer = [0, 1]
actual_answer = robot.place(0, 1)
error_message = 'Robot is placed at [0,1]'
assert_equal expected_answer, actual_answer, error_message
# Same as above
assert_equal [0, 1], robot.place(0, 1), 'Robot is placed at [0,1]'

assert_equal robot.column, 0, 'Robot column is 0'

expected_answer = 1
actual_answer = robot.row
error_message = 'Robot row should be 1 after placing at (0, 1)'
assert_equal expected_answer, actual_answer, error_message

assert_equal [1, 1], robot.place(1, 1), 'Robot is placed at 1,1'
assert_equal robot.column, 1, 'Robot column is 1'
assert_equal robot.row, 1, 'Robot row is 1'

assert_equal 'NORTH', robot.roam("NORTH"), "Robot should roam NORTH"
assert_equal 1, robot.column, "Robots column is 1"
assert_equal 0, robot.row, "Robots row is 0"

expected_answer = 'SOUTH'
actual_answer = robot.roam("SOUTH")
error_message = 'Robot should roam SOUTH'
assert_equal expected_answer, actual_answer, error_message

assert_equal 1, robot.column, "Robots column is 1"
assert_equal 1, robot.row, "Robots row is 1"



# assert_equal robot.respond_to?(:surface), true, "Robot should be able to have a surface"

puts 'tests pass'
