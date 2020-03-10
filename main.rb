# frozen_string_literal: true

require_relative 'robot'

robot = Robot.new
robot.place(1, 1)

loop do
  puts ''
  puts 'Enter a commmand [MOVE, PLACE, REPORT or HELP]:'
  # 'gets' reads 1 line from the terminal
  line_from_input = gets
  break unless line_from_input

  line_from_input = line_from_input.chomp

  if line_from_input =~ /HELP/
    puts "\
    These are the commands accepted in this program\

    MOVE <#{Robot::NORTH},#{Robot::SOUTH},#{Robot::EAST},#{Robot::WEST}>\

    PLACE X,Y

    REPORT
    "
    next
  end

  if line_from_input =~ /^MOVE/
    begin
      if line_from_input =~ /^MOVE #{Robot::NORTH}/
        puts "> Moving robot #{Robot::NORTH}"
        new_direction = robot.roam(Robot::NORTH)
        puts "> Robot is now facing #{new_direction}"

      elsif line_from_input =~ /^MOVE #{Robot::SOUTH}/
        puts "> Moving robot #{Robot::SOUTH}"
        new_direction = robot.roam(Robot::SOUTH)
        puts "> Robot is now facing #{new_direction}"

      elsif line_from_input =~ /^MOVE #{Robot::EAST}/
        puts "> Moving robot #{Robot::EAST}"
        new_direction = robot.roam(Robot::EAST)
        puts "> Robot is now facing #{new_direction}"

      elsif line_from_input =~ /^MOVE #{Robot::WEST}/
        puts "> Moving robot #{Robot::WEST}"
        new_direction = robot.roam(Robot::WEST)
        puts "> Robot is now facing #{new_direction}"
      else
        puts "> Attempting to perform MOVE. Could not execute \"#{line_from_input}\""
      end
    rescue StandardError => e
      puts "> Could not move the robot: #{e.message}"
    end
    next
  end

  if line_from_input =~ /^PLACE/
    # Get the first argument
    x = line_from_input.scan(/\d/)[0].to_i

    # Get the second argument
    y = line_from_input.scan(/\d/)[1].to_i

    # Place robot here
    robot.place(y, x)

    puts "The robot has been placed at position (#{robot.row},#{robot.column}) facing #{robot.direction}"
    next
  end

  if line_from_input =~ /^REPORT/
    puts "The robot is at position (#{robot.row},#{robot.column}) facing #{robot.direction}"
    next
  end
  puts "> #{line_from_input}"
end

puts 'Toy robot has ended. Bye'
