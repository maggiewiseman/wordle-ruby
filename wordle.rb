
class Wordle 
  def initialize(mice)
    @dictionary = get_dictionary
    @answer = get_game_answer
    @num_guesses = 0
    @user_won = false
  end

  def start
    prompt
  end

  private

  def prompt
    unless @user_won 
      if @num_guesses < 6
        STDOUT.puts("Please guess a 5 letter word:")
        guess = gets.chomp.downcase
        check_guess(guess)
      else
        STDOUT.puts("YOU LOSE!")
      end
    end
  end

  def check_guess(guess)
    if (guess.length <=> 5) != 0
      STDOUT.puts("That wasn't a 5 letter word.")
      prompt
      return
    end

    @num_guesses += 1

    if guess == @answer
      @user_wone = true
      STDOUT.puts("You win!!!")
    else 
      check_letters(guess)
    end
  end

  def get_dictionary
  end

  def get_game_answer
    @answer = "opine"
  end

  def check_letters(guess)
    STDOUT.puts("checking letters")
    prompt
  end
end