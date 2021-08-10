# frozen_string_literal: true

# creates a Truck that is parked in Neighbourhood

require "test/unit/assertions"
include Test::Unit::Assertions
require "pry"

class Truck
  attr_reader :column, :row, :direction

  NORTH = "north"
  SOUTH = "south"
  EAST = "east"
  WEST = "west"

  def initialize
    @column = 0
    @row = 0
    @direction = NORTH
  end

  def park(column, row, direction)
    if column < 0 ||
       column > 6 ||
       row < 0 ||
       row > 6
      raise "cant go below neighbourhood"
    end
    @column = column
    @row = row
    @direction = direction
    [@column, @row]
  end
  
  
  def drive
    if row == 0 && direction == SOUTH ||
      row == 6 && direction == NORTH ||
      column == 6 && direction == EAST ||
      column == 0 && direction == WEST
      raise "cant go beyond the neighbourhood"
    end
    
    if direction == NORTH
      @row += 1
    elsif direction == SOUTH
      @row -= 1
    elsif direction == EAST
      @column += 1
    elsif direction == WEST
      @column -= 1
    end
  end
  
  def turn_left
    drive
  end
 
  def turn_right
  end
end
