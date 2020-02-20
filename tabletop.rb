# Table creates Tabletop with diomensions 5 column by 5 rows
class Tabletop
  attr_accessor :row
  attr_accessor :column

  def initialize
    @row = [0, 1, 2, 3, 4]
    @column = [0, 1, 2, 3, 4]
  end
end

table = Tabletop.new
puts table.row
puts table.column