# Neighbourhood creates surface with diomensions 7 column by 7 rows
class Neigbourhood
  attr_accessor :column, :row

  def initialize
    @column = [0, 1, 2, 3, 4, 5, 6]
    @row = [0, 1, 2, 3, 4, 5, 6]
  end
end
