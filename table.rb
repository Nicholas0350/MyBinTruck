class Table
  attr_accessor :row
  attr_accessor :column

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
end