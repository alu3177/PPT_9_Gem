require 'P9_alu3177_ttt/player'

module P9Alu3177Ttt
  class MinMaxPlayer < Player
    INFINITE = 99999
    def move ( board )
        mark == "X" ? playerType = :max : playerType = :min
        board.blank? ? "b2" : minmax( board, playerType, 0 ) # First game turn move is allways b2
    end

    def heuristic_value ( board )
        return -1 if board.won? == "O"
        return 0 if board.won? == " "
        return 1 if board.won? == "X"
    end

    def clone_board ( board )
        result = Board.new([" "] * 9)
        board.squares.each_with_index do |cell, i|
            result[Board.index_to_name(i)] = cell
        end
        result
    end

    def minmax ( board, player, depth ) # Current status of the board and player (min or max)
        if board.won?
            return heuristic_value( board ) 
        end

        # Setting alfa, current player mark and next player (min or max)
        if player == :max
            alfa = -INFINITE
            mark = "X"
            nextPlayer = :min
        else         
            alfa = INFINITE
            mark = "O"
            nextPlayer = :max
        end
        moves = board.moves
        bestMove = ""
        moves.each do |move|
            nextBoard = clone_board(board)
            nextBoard[move] = mark
            prevAlfa = alfa

            player == :max ? alfa = [alfa, minmax( nextBoard, nextPlayer, depth+1 )].max :
                             alfa = [alfa, minmax( nextBoard, nextPlayer, depth+1 )].min
            bestMove = move if prevAlfa != alfa and depth == 0
        end
        depth > 0 ? alfa : bestMove
    end

    def finish( final_board )
        puts final_board
        if final_board.won? == @mark
            print "MinMax WIN!.\n\n"
        elsif final_board.won? == " "
            print "Tie game.\n\n"
        else
            print "MinMax Loose!\n\n"
        end
    end

  end
end