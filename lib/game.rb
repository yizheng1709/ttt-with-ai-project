class Game 
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end 

    def current_player
        board.turn_count.odd? ? @player_2 : @player_1
    end 

    def won? #returns array if true 
        WIN_COMBINATIONS.each do |combo|
            if (@board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X") ||
                (@board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O")
                return combo
            end 
        end
        false 
    end 

    def draw? 
        !won? && @board.full? ? true : false 
    end 

    def over?
        draw? || won? ? true : false 
    end 

    def winner
        if won? 
            @board.cells[won?[0]]
        end 
    end 

    def turn
        puts "Please enter a number 1-9:"
        user_input = current_player.move(@board)
        if @board.valid_move?(user_input)
          @board.update(user_input, current_player)
        else puts "Please enter a number 1-9:"
          @board.display
          turn
        end
        @board.display
      end

      def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

end 