require_relative 'robot.rb'
require_relative 'tabletop.rb'


assert_equal Robot, Robot, 'Should be able to find the Robot class'
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

assert_equal Robot::NORTH, robot.roam(Robot::NORTH), 'Robot should roam NORTH'
assert_equal 1, robot.column, 'Robots column is 1'
assert_equal 0, robot.row, 'Robots row is 0'

expected_answer = Robot::SOUTH
actual_answer = robot.roam(Robot::SOUTH)
error_message = 'Robot should roam SOUTH'
assert_equal expected_answer, actual_answer, error_message

assert_equal 1, robot.column, 'Robots column is 1'
assert_equal 1, robot.row, 'Robots row is 1'

expected_answer = Robot::EAST
actual_answer = robot.roam(Robot::EAST)
error_message = 'Robot should roam EAST'
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, robot.column, 'Robots column is 0'
assert_equal 1, robot.row, 'Robots row is 1'

expected_answer = Robot::WEST
actual_answer = robot.roam(Robot::WEST)
error_message = 'Robot should roam WEST'
assert_equal expected_answer, actual_answer, error_message

assert_equal 1, robot.column, 'Robots column is 1'
assert_equal 1, robot.row, 'Robots row is 1'

robot.place(0, 0)

expected_answer = 'cant go beyond the tabletop'
actual_answer = begin
  robot.roam(Robot::NORTH)
                rescue StandardError => e
                  e.message
end
error_message = 'Robot should raise an error'
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, robot.column, 'Robots column is 0'
assert_equal 0, robot.row, 'Robots row is 0'

expected_answer = 'cant go beyond the tabletop'
actual_answer = begin
  robot.roam(Robot::EAST)
                rescue StandardError => e
                  e.message
end
error_message = 'Robot should raise an error'
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, robot.column, 'Robots column is 0'
assert_equal 0, robot.row, 'Robots row is 0'

robot.place(5, 5)

expected_answer = 'cant go beyond the tabletop'
actual_answer = begin
  robot.roam(Robot::SOUTH)
                rescue StandardError => e
                  e.message
end
error_message = 'Robot should raise an error'
assert_equal expected_answer, actual_answer, error_message

assert_equal 5, robot.column, 'Robots column is 5'
assert_equal 5, robot.row, 'Robots row is 5'

expected_answer = 'cant go beyond the tabletop'
actual_answer = begin
  robot.roam(Robot::WEST)
                rescue StandardError => e
                  e.message
end
error_message = 'Robot should raise an error'
assert_equal expected_answer, actual_answer, error_message

assert_equal 5, robot.column, 'Robots column is 5'
assert_equal 5, robot.row, 'Robots row is 5'


# assert_equal robot.respond_to?(:surface), true, "Robot should be able to have a surface"

puts 'tests pass'
