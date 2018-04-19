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
 			puts "le joueur ayant le symbole #{plateau[i][:"0"].value} gagne avec la ligne #{i}"	
 		elsif (plateau[0][:"#{i}"].value == plateau[1][:"#{i}"].value && plateau[0][:"#{i}"].value == plateau[2][:"#{i}"].value) && (plateau[0][:"#{i}"].value != "")
 			puts "le joueur ayant le symbole #{plateau[0][:"#{i}"].value} gagne avec la colonne #{i}"
 		else
		end 
	end

	#diago
		if (plateau[0][:"0"].value == plateau[1][:"1"].value && plateau[0][:"0"].value == plateau[2][:"2"].value) && (plateau[0][:"0"].value != "")		
 			puts "le joueur ayant le symbole #{plateau[0][:"0"].value} gagne avec la première diagonale"	
 		elsif (plateau[0][:"2"].value == plateau[1][:"1"].value && plateau[0][:"2"].value == plateau[2][:"0"].value) && (plateau[0][:"2"].value != "")		
 			puts "le joueur ayant le symbole #{plateau[0][:"2"].value} gagne avec la diagonale inversée"
 		else
 		end
 	""
 	end

end
 

class Game
  attr_accessor :board, :player, :turn 

  def initialize
    @player = []
    @player[0] = Player.new("0")
    @player[1] = Player.new("X")
    @board = Board.new
   	@turn = 0
   	@ligne = ""
   	@colonne = ""
  end

  def next_turn
  	puts "#{@player[@turn%2].name}, où veux tu mettre ton pion? un chiffre pour la ligne (0 à 2), le second pour la colonne (0 à 2)"
  	@ligne = gets.chomp.to_i
  	@colonne = gets.chomp.to_i
  		if @turn%2 == 0
			board.plateau[@ligne][:"#{@colonne}"].value = "O"
		else
			board.plateau[@ligne][:"#{@colonne}"].value = "X"
		end
    board.puts_plateau
    @turn += 1
  end

  def runprogram
	puts "bienvenue, morpionneurs"
	board.puts_plateau
	while board.verif == "" do
		next_turn
	end
	coucou.board.verif
  end

end #end de class game



class Player
  attr_accessor :name, :symbol
  def initialize(symbol)
  	puts "Nom de joueur"
    @name = gets.chomp.to_s
    @symbol = symbol
  end
end

coucou = Game.new
coucou.runprogram














#coucou.next_turn
#coucou.board.verif
=begin
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif
coucou.next_turn
coucou.board.verif



runprogram
=end



#coucou.board.plateau[1][:"1"].value = "0"

#coucou.board.puts_plateau
#puts coucou.player[0].name

#coucou.board.puts_plateau

#puts "nacre" + coucou.board.plateau[1][:"1"].value
#puts coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes
=begin
coucou.board.plateau[2][:"0"].value = "X"
coucou.board.puts_plateau
p coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes


coucou.board.plateau[0][:"1"].value = "0"
coucou.board.puts_plateau
p coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes

coucou.board.plateau[0][:"2"].value = "X"
coucou.board.puts_plateau
p coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes

coucou.board.plateau[2][:"1"].value = "0"
coucou.board.puts_plateau
p coucou.board.verif #penser à mettre puts si je veux pas avoir les quotes
=end