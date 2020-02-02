class Table
  attr_accessor :row
  attr_accessor :column


  def initialize(row, column)
    @row = row
    @column = column
  end


  def commands
    PLACE == ''
    MOVE == ''
    LEFT == ''
    RIGHT == ''
    REPORT == ''
  end
  
  


end