module Hangman
  # hangman game displays
  class Show
    def begin
      <<-HEREDOC
        WELCOME TO HANGMAN
        Type 'start' to Start a new game
        or   'load' to Load an existing game
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

    def save_or_quit?
      <<-HEREDOC
      PRESS 's' TO SAVE
            'c' TO CONTINUE
            'q' TO QUIT
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
          |
        --+------------
        GAME-OVER!!!! :(
      HEREDOC
    end

    def continue
      <<-HEREDOC
        DO YOU LIKE TO CONTINUE
        PRESS 'Y' TO CONTINUE
      HEREDOC
    end

    def end
      <<-HEREDOC
        GOODBYE!!
      HEREDOC
    end

    def wrong_load
      <<-HEREDOC
        NO SAVED GAME.
        Run 'hangman' and select 'start'to begin
      HEREDOC
    end
  end
end
