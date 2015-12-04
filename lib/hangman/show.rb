module Hangman
  # hangman game displays
  class Show
    def begin
      <<-HEREDOC
        WELCOME TO HANGMAN
        Type 'start' to Start a new game
      HEREDOC
    end

    def show_right_entry
      <<-HEREDOC
      GREAT!!
      HEREDOC
    end

    def show_wrong_entry
      <<-HEREDOC
      WRONG! TRY AGAIN!!
      HEREDOC
    end

    def show_win
      <<-HEREDOC
      CONGRATULATIONS!!! YOU HAVE WON!
      HEREDOC
    end

    def hang
      <<-HEREDOC
          +------+
          |      |
          |      O
          |     /|\
          |     / \
          |
        --+------------
        GAME-OVER!!!! :(
      HEREDOC
    end
  end
end
