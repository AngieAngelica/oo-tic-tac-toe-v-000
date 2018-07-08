class TicTacToe
def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]    
  
  ]
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)

  user_input.to_i-1
  
end

def move(index, player = “X”)
  @board[index] = player
end


def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

 def turn
  puts "Please enter 1-9:"
  input = gets.strip
 
  index = input_to_index(input)
  if valid_move?(index)
      move(index, player_token)
      display_board
  else
    turn
  end
end
 
 def turn_count(board)
  count = 0
  @board.each do |token|
    if token == "X" || token =="O"
    count += 1 
     end
   end 
    return count
 end
 
 def current_player(board)
  count = turn_count(board)
  if count % 2 ==0 
    return "X"
  else return "O"
  end
end 
 
def won?(board)
    WIN_COMBINATIONS.each do |win_combination| 
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1] 
    win_index_3 = win_combination[2] 
    
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    
    if position_1 =="X" && position_2 =="X" && position_3 =="X"
      return win_combination
    elsif position_1 =="O" && position_2 =="O" && position_3 =="O"
      return win_combination
    else #a board with no win 
       false
    end
  end
  false
end


def full?(board)
  if @board.detect {|i| i == " " || i == nil}
    false
  else
    true
  end
end
    
    
def draw?(board)
  if !won?(board) && full?(board)
    true
  else false
  end
end  


def over?(board)
  if draw?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  elsif won?(board) && !full?(board)
    return true
  else false
  end
end 

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end