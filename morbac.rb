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
    @fin = false
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
 			puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[i][:"0"].value} gagne avec la ligne #{i}."
 			@fin = true	
 		elsif (plateau[0][:"#{i}"].value == plateau[1][:"#{i}"].value && plateau[0][:"#{i}"].value == plateau[2][:"#{i}"].value) && (plateau[0][:"#{i}"].value != "")
 			puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"#{i}"].value} gagne avec la colonne #{i}."
 			@fin = true
 		else
		end 
	end

	#diago
	if (plateau[0][:"0"].value == plateau[1][:"1"].value && plateau[0][:"0"].value == plateau[2][:"2"].value) && (plateau[0][:"0"].value != "")		
 		puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"0"].value} gagne avec la première diagonale."	
 		@fin = true
 	elsif (plateau[0][:"2"].value == plateau[1][:"1"].value && plateau[0][:"2"].value == plateau[2][:"0"].value) && (plateau[0][:"2"].value != "")		
 		puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"2"].value} gagne avec la diagonale inversée."
 		@fin = true
	else

   	end
   	
   	if @fin == false
   		return ""
   	else
   		return "nacre"
 	end
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
  	puts "A toi,#{@player[@turn%2].name}! Où veux tu mettre ton pion? Indique un chiffre entre 0 et 2 pour la ligne, puis un second entre 0 et 2 pour la colonne."
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
	puts "Bienvenue, morpionneurs. Que la force soit avec vous."
	board.puts_plateau
	while board.verif == ""
		next_turn
	end

	puts "Merci d'avoir joué, on recommence?"
	
end

end #end de class game



class Player
  attr_accessor :name, :symbol
  def initialize(symbol)
  	puts "Prénom du joueur?"
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