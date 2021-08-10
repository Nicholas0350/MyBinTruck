require_relative "truck.rb"
require_relative "neighbourhood.rb"

assert_equal Truck, Truck, "Should be able to find the Truck class"
truck = Truck.new
assert_equal truck.respond_to?(:drive), true, "Truck should be able to drive"
assert_equal truck.respond_to?(:park), true, "Truck should be able to be parked"

expected_answer = [0, 1]
actual_answer = truck.park(0, 1)
error_message = "Truck is parked at [0,1]"
assert_equal expected_answer, actual_answer, error_message
# Same as above
assert_equal [0, 1], truck.park(0, 1), "Truck is parked at [0,1]"

assert_equal truck.column, 0, "Truck column is 0"

expected_answer = 1
actual_answer = truck.row
error_message = "Truck row should be 1 after placing at (0, 1)"
assert_equal expected_answer, actual_answer, error_message

assert_equal [1, 1], truck.park(1, 1), "Truck is parked at 1,1"
assert_equal truck.column, 1, "Truck column is 1"
assert_equal truck.row, 1, "Truck row is 1"

assert_equal Truck::NORTH, truck.drive(Truck::NORTH), "Truck should drive NORTH"
assert_equal 1, truck.column, "Trucks column is 1"
assert_equal 0, truck.row, "Trucks row is 0"

expected_answer = Truck::SOUTH
actual_answer = truck.drive(Truck::SOUTH)
error_message = "Truck should drive SOUTH"
assert_equal expected_answer, actual_answer, error_message

assert_equal 1, truck.column, "Trucks column is 1"
assert_equal 1, truck.row, "Trucks row is 1"

expected_answer = Truck::EAST
actual_answer = truck.drive(Truck::EAST)
error_message = "Truck should drive EAST"
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, truck.column, "Trucks column is 0"
assert_equal 1, truck.row, "Trucks row is 1"

expected_answer = Truck::WEST
actual_answer = truck.drive(Truck::WEST)
error_message = "Truck should drive WEST"
assert_equal expected_answer, actual_answer, error_message

assert_equal 1, truck.column, "Trucks column is 1"
assert_equal 1, truck.row, "Trucks row is 1"

truck.park(0, 0)

expected_answer = "cant go beyond the  neighbourhood"
actual_answer = begin
    truck.drive(Truck::NORTH)
  rescue StandardError => e
    e.message
  end
error_message = "Truck should raise an error"
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, truck.column, "Trucks column is 0"
assert_equal 0, truck.row, "Trucks row is 0"

expected_answer = "cant go beyond the  neighbourhood"
actual_answer = begin
    truck.drive(Truck::EAST)
  rescue StandardError => e
    e.message
  end
error_message = "Truck should raise an error"
assert_equal expected_answer, actual_answer, error_message

assert_equal 0, truck.column, "Trucks column is 0"
assert_equal 0, truck.row, "Trucks row is 0"

truck.park(5, 5)

expected_answer = "cant go beyond the  neighbourhood"
actual_answer = begin
    truck.drive(Truck::SOUTH)
  rescue StandardError => e
    e.message
  end
error_message = "Truck should raise an error"
assert_equal expected_answer, actual_answer, error_message

assert_equal 5, truck.column, "Trucks column is 5"
assert_equal 5, truck.row, "Trucks row is 5"

expected_answer = "cant go beyond the  neighbourhood"
actual_answer = begin
    truck.drive(Truck::WEST)
  rescue StandardError => e
    e.message
  end
error_message = "Truck should raise an error"
assert_equal expected_answer, actual_answer, error_message

assert_equal 5, truck.column, "Trucks column is 5"
assert_equal 5, truck.row, "Trucks row is 5"

# assert_equal truck.respond_to?(:neighbourhood), true, "Truck should be able to have a neighbourhood"

puts "tests pass"
