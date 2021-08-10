# frozen_string_literal: true

require_relative "truck"

truck = Truck.new

loop do
  puts ""
  puts "Enter a commmand [PARK, DRIVE, LEFT, RIGHT, PICKUP, CALLCENTRAL"
  # 'gets' reads 1 line from the terminal
  line_from_input = gets
  break unless line_from_input

  line_from_input = line_from_input.chomp

  if line_from_input =~ /HELP/
    puts "\
    These are the commands accepted in this program\

    PARK X,Y,F
    DRIVE <#{Truck::NORTH},#{Truck::SOUTH},#{Truck::EAST},#{Truck::WEST}>\
    LEFT <#{Truck::NORTH},#{Truck::SOUTH},#{Truck::EAST},#{Truck::WEST}>\
    RIGHT <#{Truck::NORTH},#{Truck::SOUTH},#{Truck::EAST},#{Truck::WEST}>\
    PICKUP <#{Truck::NORTH},#{Truck::SOUTH},#{Truck::EAST},#{Truck::WEST}>\
     
    "
    next
  end

  if line_from_input =~ /^DRIVE/
    begin
      if line_from_input =~ /^DRIVE/
        puts "> Moving truck"
        new_direction = truck.drive
      end
    rescue StandardError => e
      puts "> Could not drive the truck: #{e.message}"
    end
    next
  end

  if line_from_input =~ /^PARK/
    splitted = line_from_input.split(" ") #=> ['PARK', '3,3,east']
    values = splitted[1].split(",") #=> ['3', '3', 'east']
    x = values[0].to_i
    y = values[1].to_i
    f = values[2] # Get the first argument

    # Park truck here
    truck.park(y, x, f)
    puts "The truck has been parked at position (#{truck.row},#{truck.column}) facing #{truck.direction}"
    next
  end

  if line_from_input =~ /^LEFT/
    puts "> Truck is moving left (#{truck.row},#{truck.column}) facing #{truck.turn_left}" 
      
    next
  end


  if line_from_input =~ /^RIGHT/
    puts "> Truck is moving right (#{truck.row},#{truck.column}) facing #{truck.turn_right}" 
    next
  end

  if line_from_input =~ /^CALLCENTRAL/
    puts "The truck is at position (#{truck.row},#{truck.column}) facing #{truck.direction}"
    next
  end
  puts "> #{line_from_input}"


  if line_from_input =~ /^PICKUP/
    puts "BIN PICKED UP FROM (#{truck.row},#{truck.column}) facing #{truck.direction}"
    next
  end
  puts "> #{line_from_input}"
end

puts "Truck has ended. Bye"
