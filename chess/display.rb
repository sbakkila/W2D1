require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'


class Display
  attr_reader :cursor, :board
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if [i, j] == @cursor.cursor_pos
          print piece.to_s.colorize(:red).colorize( :background => :blue)
        else
          print piece.to_s.colorize(piece.team)
        end
      end
      puts ''
    end
    nil
  end

end

dis = Display.new
  dis.render
  sleep(1)
dis.board.move_piece([0,0],[4,4])
  dis.render
# dis.render
# dis.cursor.get_input
# dis.render

while true
  system('clear')
  dis.render
  dis.cursor.get_input
end
