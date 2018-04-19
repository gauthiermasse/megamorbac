class Boardcase #on crée une classe pour chaque case du plateau afin d'initialiser leur valeur à 0 et pouvoir jouer sur leur valeur
  attr_accessor :value

  def initialize
    @value = "" #la value de chaque case doit être nulle au départ
  end

end

class Board #on crée une classe pour le plateau
  attr_accessor :plateau

  def initialize #on initialise le plateau à un ensemble de 9 cases de la classe Boardcase
    @plateau = [] # le plateau est un array vide
    3.times do | y |
      @plateau[y] = Hash.new #on remplit le plateau de 3 hash
      3.times do | x |
        @plateau[y][:"#{x}"] = Boardcase.new #chacun des 3 hash contiennent 3 clés correspondant à une case de la class Boardcase (vide)
      end
    end
    @fin = false # j'utilise cette variable pour indiquer lorsque la partie se termine -> je l'initialise donc à 0
  end

  def puts_plateau #on affiche le plateau
    3.times do | y | #on affiche la structure horizontale du tableau, les deux barres composées de ---+---+---
      print "\n"
      unless y == 0 then print "---+---+---\n" end
      3.times do | x |
        char = "\s"# grâce à char on remplit chaque case avec soit sa valeur (0 ou X via le unless ci dessous) soit rien du tout
        unless @plateau[y][:"#{x}"].value == "" then char = @plateau[y][:"#{x}"].value end 
        print "\s#{char}\s"
        if x < 2 then print "|" end #on affiche la structure verticale du morpion: les | verticaux
      end
    end
    print "\n\n"
  end

  def verif #à chaque tour il faudra vérifier que la partie n'est pas terminée avant d'en lancer un nouveau
  	#on checke les cas de figures de victoire grâce à une ligne (3 cas) ou une colonne (3 cas)
 	for i in 0..2
 		if (plateau[i][:"0"].value == plateau[i][:"1"].value && plateau[i][:"0"].value == plateau[i][:"2"].value) && (plateau[i][:"0"].value != "")			
 			puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[i][:"0"].value} gagne avec la ligne #{i}."
 			@fin = true	#on retrouve notre variable fin initialisée à false, qui permettra de mettre stop à la partie lorsque quelqu'un gagne
 		elsif (plateau[0][:"#{i}"].value == plateau[1][:"#{i}"].value && plateau[0][:"#{i}"].value == plateau[2][:"#{i}"].value) && (plateau[0][:"#{i}"].value != "")
 			puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"#{i}"].value} gagne avec la colonne #{i}."
 			@fin = true
 		else
		end 
	end

	#on checke les cas de figures de victoire grâce à une diagonale (2 cas)
	if (plateau[0][:"0"].value == plateau[1][:"1"].value && plateau[0][:"0"].value == plateau[2][:"2"].value) && (plateau[0][:"0"].value != "")		
 		puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"0"].value} gagne avec la première diagonale."	
 		@fin = true
 	elsif (plateau[0][:"2"].value == plateau[1][:"1"].value && plateau[0][:"2"].value == plateau[2][:"0"].value) && (plateau[0][:"2"].value != "")		
 		puts "FIN DE LA PARTIE! Le joueur jouant avec le symbole #{plateau[0][:"2"].value} gagne avec la diagonale inversée."
 		@fin = true
	else
   	end
   	
   	if @fin == false
   		return "" #on demandera dans la méthode de run du programme la valeur renvoyée par la méthode verif, si ="" alors on continue, sinon c'est la fin de la partie
   	else
   		return "fin de la partie"
 	end

  end

end
 

class Game #la classe game permet de tout regrouper et de lancer une instance de jeu 
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

  def next_turn #cette méthode décrit un tour
  	puts "A toi,#{@player[@turn%2].name}! Où veux tu mettre ton pion? Indique un chiffre entre 0 et 2 pour la ligne, puis un second entre 0 et 2 pour la colonne."
  	@ligne = gets.chomp.to_i
  	@colonne = gets.chomp.to_i
  		if @turn%2 == 0 # le modulo permet de faire ressortir le premier joueur, qui joue les tours pairs
			board.plateau[@ligne][:"#{@colonne}"].value = "0" #on affecte le choix du premier joueur dans le plateau		
		else
			board.plateau[@ligne][:"#{@colonne}"].value = "X"#on affecte le choix du second joueur dans le plateau
		end
    board.puts_plateau #on affiche le plateau
    @turn += 1 #on permet de passer au joueur suivant lors du prochain appel de la méthode
  end

  def runprogram #on ordonne une partie
	puts "Bienvenue, nobles morpionneurs. Que la force soit avec vous."
	board.puts_plateau
	while board.verif == "" #on continue les tours jusqu'à ce que notre méthode vérif ressorte quelque chose via la variable @fin
		next_turn 
	end
	puts "Bravo et merci d'avoir joué, on recommence?"
   end

end 



class Player #permet de créer un joueur
  attr_accessor :name, :symbol
  def initialize(symbol)
  	puts "Prénom du joueur?"
    @name = gets.chomp.to_s
    @symbol = symbol
  end
end

coucou = Game.new #on crée une instance du jeu
coucou.runprogram #on appelle la méthode qui décrit un tour














