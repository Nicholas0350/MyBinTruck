# frozen_string_literal: true

# creates a Robot that is placed on Tabletop

require 'test/unit/assertions'
include Test::Unit::Assertions
require 'pry'

class Robot
  attr_reader :column, :row, :direction

  NORTH = 'north'
  SOUTH = 'south'
  EAST = 'east'
  WEST = 'west'

  def initialize
    @column = 0
    @row = 0
    @direction = NORTH
  end

  def place(column, row)
    @column = column
    @row = row
    [@column, @row]
  end

  def roam(direction)
    if row <= 0 && direction == NORTH ||
       row >= 5 && direction == SOUTH ||
       column <= 0 && direction == EAST ||
       column >= 5 && direction == WEST
      raise 'cant go beyond the tabletop'
    end

    if direction == NORTH
      @row = row - 1
    elsif direction == SOUTH
      @row = row + 1
    elsif direction == EAST
      @column = column - 1
    elsif direction == WEST
      @column = column + 1
    end

    @direction = direction
  end
end
