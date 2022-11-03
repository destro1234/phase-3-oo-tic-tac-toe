require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0 ,3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0 ,4, 8],
        [2, 4, 6]
    ]

    def initialize

        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(input, token="X")
        @board[input] = token
    end

    def position_taken?(index)
        @board[index.to_i] == "X" || @board[index.to_i] == "O"
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        counter = 0
        @board.each do |position|
            if position != " "
                counter += 1
            end
        end
        counter
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        input = gets.strip 
        index = input_to_index(input)
        if valid_move?(index)
            display_board
            token = current_player
            move(index, token)
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                @@winner = @board[combo[0]]
                return combo
            end
        end
    end

    def full?
        @board.all? do |index|
            index == "X" || index == "O"
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        until over?
            turn


        end
        if won?
            puts "Congratulations #{@@winner}!"
        elsif draw?
            puts "Cat's Game!"

        end
        
    end
end


