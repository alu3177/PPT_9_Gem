require 'P9_alu3177_ttt/player'

module P9Alu3177Ttt
  class DumbPlayer < Player
    def move( board )
      moves = board.moves
      moves[rand(moves.size)]
    end
  end
end
