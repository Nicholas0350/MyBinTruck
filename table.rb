class Table
  attr_accessor :row
  attr_accessor :column

  attr_reader :robots

  def initialize(row, column)
    @row = row
    @column = column
    @robots = []
  end

  def commands
    PLACE == ''
    MOVE == ''
    LEFT == ''
    RIGHT == ''
    REPORT == ''
  end

  def place robot, x, y
    existing_robot = @robots.find { |_robot| _robot == robot }
    
    unless existing_robot
      existing_robot = robot
      @robots << robot      
    end

    existing_robot.x = x
    existing_robot.y = y
  end

  def move robot, direction
    case direction
    when :NORTH
      robot.y = robot.y - 1 if robot.y > 0
    when :SOUTH
      robot.y = robot.y + 1 if robot.y < (column - 1)
    when :EAST
      robot.x = robot.x + 1 if robot.x < (row - 1)
    when :WEST
      robot.x = robot.x - 1 if robot.x > 0
    end
  end
end