
class Wordle 
  def initialize
    @dictionary = get_dictionary
    @answer = get_game_answer
    @answer_arr = @answer.split("")
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
      STDOUT.puts("That wasn't a 5 letter word.\n")
      prompt
      return
    end

    @num_guesses += 1

    if guess == @answer
      @user_wone = true
      STDOUT.puts("You win!!!")
    else 
      result = check_letters(guess)
      STDOUT.puts("\nGuess ##{@num_guesses}: #{result.join("")}\n\n")
      prompt
    end
  end

  def get_dictionary
  end

  def get_game_answer
    @answer = "opine"
  end

  def check_letters(guess)
    result = []
    guess.split("").each_with_index{ |letter, index| 
      if letter == @answer[index]
        result << "#{letter} "
      elsif @answer_arr.include?(letter)
        result << "~#{letter}~ "
      else
        result << "!#{letter}! "
      end
    }
    return result
  end
end