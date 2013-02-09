require 'P9_alu3177_ttt/player'

module P9Alu3177Ttt
  class MinMaxPlayer < Player
    INFINITE = 99999
    def move ( board )
        mark == "X" ? playerType = :max : playerType = :min
        board.blank? ? "b2" : alphabeta( board, playerType, 0 ) # First game turn move is allways b2
    end

    def heuristic_value ( won )
        return -1 if won == "O"
        return 0 if won == " "
        return 1 if won == "X"
    end

    def minmax ( board, player, depth ) # Current status of the board and player (min or max)
        if board.won?
            return heuristic_value( board.won? )
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
        bestMove = ""
        board.moves.each do |move|
            nextBoard = board.clone
            nextBoard[move] = mark
            prevAlfa = alfa
            player == :max ? alfa = [alfa, minmax( nextBoard, nextPlayer, depth+1 )].max :
                             alfa = [alfa, minmax( nextBoard, nextPlayer, depth+1 )].min
            bestMove = move if depth == 0 and prevAlfa != alfa                    
        end
        depth > 0 ? alfa : bestMove
    end

    def alphabeta ( board, player, depth, alpha = -INFINITE, beta=INFINITE )
        if board.won?
            return heuristic_value( board.won? )
        end
        bestMove = ""
        if player == :max
            board.moves.each do |move|
                nextBoard = board.clone
                nextBoard[move] = "X"
                prevAlpha = alpha
                alpha = [alpha, alphabeta( nextBoard, :min, depth+1, alpha, beta )].max
                bestMove = move if depth == 0 and prevAlpha != alpha
                break if beta <= alpha
            end
            depth > 0 ? alpha : bestMove
        elsif player == :min
            board.moves.each do |move|
                nextBoard = board.clone
                nextBoard[move] = "O"
                prevBeta = beta
                beta = [beta, alphabeta( nextBoard, :max, depth+1, alpha, beta )].min
                bestMove = move if depth == 0 and prevBeta != beta
                break if beta <= alpha
            end
            depth > 0 ? beta : bestMove
        end

    end

  end
end