# Table creates Tabletop with diomensions 5 column by 5 rows
class Tabletop
  attr_accessor :column, :row

  def initialize
    @column = [0, 1, 2, 3, 4]
    @row = [0, 1, 2, 3, 4]
  end
end
