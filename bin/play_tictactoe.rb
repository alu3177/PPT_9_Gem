require 'P9_alu3177_ttt'

#if __FILE__ == $0
#  if ARGV.size > 0 and ARGV[0] == "-d"
#    game = P9Alu3177Ttt::Game.new P9Alu3177Ttt::HumanPlayer,
#                   P9Alu3177Ttt::DumbPlayer
#  else
#    game = P9Alu3177Ttt::Game.new P9Alu3177Ttt::HumanPlayer,
#                   P9Alu3177Ttt::SmartPlayer
#  end
#  game.play
#end

game = P9Alu3177Ttt::Game.new P9Alu3177Ttt::HumanPlayer,
            P9Alu3177Ttt::MinMaxPlayer

game.play