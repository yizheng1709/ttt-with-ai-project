class Board
    attr_accessor :cells 

    def initialize
        self.reset!
    end 

    def display 
       puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
       puts "-----------"
       puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
       puts "-----------"
       puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end 

    def reset! 
        @cells = Array.new(9, " ")
    end 

    def position(input)
        index = input.to_i - 1
        @cells[index]
    end 

    def full?
        @cells.any?(" ") ? false : true 
    end 

    def turn_count
        @cells.count("O") + @cells.count("X")
    end 

    def taken?(input)
        position(input).include?(" ") || position(input).nil? ? false : true 
    end 

    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input) ? true : false 
    end 

    def update(input, player)
        index = input.to_i - 1
        @cells[index] = player.token
    end 

end 