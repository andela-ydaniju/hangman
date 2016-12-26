module Hangman
  class Show
    def begin
      <<-HEREDOC
        WELCOME TO HANGMAN
        Type 's or start' to Start a new game,
             'l or load' to Load an existing game,
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

    def save_or_quit
      <<-HEREDOC
      PRESS 'x' TO SAVE
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
        ENTER OTHER CHARACTERS TO QUIT
      HEREDOC
    end

    def end
      'GOODBYE!!'
    end

    def wrong_load
      <<-HEREDOC
        NO SAVED GAME.
        Run 'hangman' and select 'start'to begin
      HEREDOC
    end

    def partial_help_message
      <<-HEREDOC
        hangman:  Initialize a the game
        hangman --help: Shows you this message
        hangman -f <file_path> : Initializes game with another dictionary

        Reply prompt with:
        s, start - starts a new game on initialization
        l, load - loads an existing game on initialization
      HEREDOC
    end

    def help_message
      puts partial_help_message
      <<-HEREDOC
        During play
        Any entry except numbers and alphabets - save options
        s - save
        c - continue
        q - quit
      HEREDOC
    end
  end
end
