class Boardcase
  attr_accessor :value

  def initialize
    @value = ""
  end

end

class Board
  attr_accessor :plateau

  def initialize
    @plateau = []
    3.times do | y |
      @plateau[y] = Hash.new
      3.times do | x |
        @plateau[y][:"#{x}"] = Boardcase.new
      end
    end
  end

  def puts_plateau
    3.times do | y |
      print "\n"
      unless y == 0 then print "---+---+---\n" end
      3.times do | x |
        char = "\s"
        unless @plateau[y][:"#{x}"].value == "" then char = @plateau[y][:"#{x}"].value end
        print "\s#{char}\s"
        if x < 2 then print "|" end
      end
    end
    print "\n\n"
  end

  def verif
  	#line+column 	
 	for i in 0..2
 		if (plateau[i][:"0"].value == plateau[i][:"1"].value && plateau[i][:"0"].value == plateau[i][:"2"].value) && (plateau[i][:"0"].value != "")			
 			return "joueur #{plateau[i][:"0"].value} est un bg avec sa megaligne #{i}"	
 		elsif (plateau[0][:"#{i}"].value == plateau[1][:"#{i}"].value && plateau[0][:"#{i}"].value == plateau[2][:"#{i}"].value) && (plateau[0][:"#{i}"].value != "")
 			return "joueur #{plateau[0][:"#{i}"].value} est un bg avec sa colonne massive #{i}"
 		else
		end 
	end

	#diago
		if (plateau[0][:"0"].value == plateau[1][:"1"].value && plateau[0][:"0"].value == plateau[2][:"2"].value) && (plateau[0][:"0"].value != "")		
 			return "joueur #{plateau[0][:"0"].value} est un bg avec sa diago d'enculé"	
 		elsif (plateau[0][:"2"].value == plateau[1][:"1"].value && plateau[0][:"2"].value == plateau[2][:"0"].value) && (plateau[0][:"2"].value != "")		
 			return "joueur #{plateau[0][:"2"].value} est un bg avec sa diago d'enculé"
 		end
 	""
 	end

end
 

class Game
  attr_accessor :board#, :turn, :player, 

  def initialize
    @player = []
    @player[0] = Player.new("O")
    @player[1] = Player.new("X")
    @board = Board.new
   	@turn = 0
  end

  #def next_turn
  #  @turn +=1

  #end

end


class Player
  attr_accessor :name, :symbol
  def initialize(symbol)
  	puts "Nom de joueur"
    @name = gets.chomp.to_s
    @symbol = symbol
  end
end



coucou = Game.new


coucou.board.plateau[0][:"2"].value = "0"
coucou.board.plateau[1][:"1"].value = "0"
coucou.board.plateau[2][:"0"].value = "0"
coucou.board.puts_plateau
p coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes