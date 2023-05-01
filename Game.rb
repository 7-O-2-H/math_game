require "./Player"

# declare Gane class
class Game

  def initialize 
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @winner = false
    @turn = 1
  end

  def play
    while !self.winner
      puts "--------- NEW TURN ---------"
      if self.turn % 2 == 0
        player_up = self.player2
        player_on_deck = self.player1
      else 
        player_up = self.player1
        player_on_deck = self.player2
      end
      new_question player_up, player_on_deck
      self.turn += 1
    end
    puts "--------- GAME OVER ---------"
  end

  def new_question player_up, player_on_deck
    
    num1 = rand(1..20)
    num2 = rand(1..20)

    puts "#{player_up.name}: what does #{num1} plus #{num2} equal?"
    print ">"

    answer = $stdin.gets.chomp.to_i

    player_up.lose_life if answer != (num1 + num2)

    self.winner = true if player_up.lives == 0

    valid = answer == (num1 + num2)
    q_result valid, player_up,  player_on_deck

  end

  def q_result correct, player_up, player_on_deck
    if correct
      puts "#{player_up.name} has answered correctly!"
    else 
      puts "#{player_up.name} has answered incorrectly!"
    end
    
    if self.winner
      puts "#{player_on_deck.name} wins!"
    
    end

  end
  
  attr_accessor :player1, :player2, :winner, :turn

end

