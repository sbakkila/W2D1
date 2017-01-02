require 'Singleton'

class Piece
  attr_reader :team

  def initialize(postion, board, team)
    @pos = postion
    @board = board
    @team = team
  end


end

class NullPiece < Piece
  # include Singleton

  attr_reader :color, :symbol

  def initialize
    @color = :black
    @symbol = "_"
  end

  def to_s
    @symbol
  end
end

module SlidingPiece
  def moves

  end
end


module SteppingPiece
  def moves

  end
end

#Sliding Pieces
class Queen < Piece
  include SlidingPiece

  def move_dirs

  end

  def to_s
    'Q'
  end
end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
  end

  def to_s
    'B'
  end
end

class Rook < Piece
  include SlidingPiece

  def move_dirs
  end

  def to_s
    'R'
  end
end

#Stepping Pieces
class King < Piece
  include SteppingPiece

  def to_s
    'K'
  end
end

class Knight < Piece
  include SteppingPiece

  def to_s
    'k'
  end
end

#other

class Pawn < Piece

  def to_s
    'P'
  end

end
