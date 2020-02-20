require "test/unit/assertions"
include Test::Unit::Assertions

class Robot


  def roam
    
  end
  


end

assert_equal Robot, Robot, "Shuld eb able to find the Robot class" 
robot = Robot.new
assert_equal robot.respond_to?(:roam), true, "Robot should be able to roam"
# assert_equal robot.roam, 'NORTH', "Robot should roam NORTH"
# assert_equal robot.respond_to?(:surface), true, "Robot should be able to have a surface"

