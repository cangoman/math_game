class Game
  
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @problem = Problem.new
    @player_asks, @player_responds = @player2, @player1
  end

  def play 
    banner("New game")
    new_turn
    
    while @player1.lives > 0 && @player2.lives > 0 do
      banner('NEW TURN')
      new_turn
    end

    get_winner
  end

  def new_turn
    #switch current player
    switch_players
    #generate new problem + print it
    puts "#{@player_asks.name}: What does #{@problem.new_problem} equal?"

    #get answer + validate
    answer = gets.chomp
    
    if (validate_answer(answer))
      puts "#{@player_asks.name}: YES! You are correct"
    else 
      puts "#{@player_asks.name}: Seriously?!? No!"
      @player_responds.lose_life
    end

    current_score
  end

  def validate_answer(answer)
    if (@problem.result == answer.to_i)
      true
    else
      false
    end
  end

  def banner(text)
    puts "----- #{text} -----"
  end

  def get_winner
    winner = @player1.lives == 0 ? @player2 : @player1
    puts "#{winner.name} wins with a score of #{winner.lives}/3!" 
    banner("GAME OVER")
  end

  def switch_players
    @player_asks, @player_responds = @player_responds, @player_asks
  end

  def current_score
    puts "P1: #{@player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end
end
