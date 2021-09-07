class Game
    @@gamePlate = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
    ]
    def initialize(player1, player2)
        @p1 = player1
        @p2 = player2
    end
    def showCurrentPlayers
        puts "#@p1 - vs - #@p2"
    end
    def showCurrentTable
        puts "
         #{@@gamePlate[0][0]} | #{@@gamePlate[0][1]} | #{@@gamePlate[0][2]}
         --+---+--
         #{@@gamePlate[1][0]} | #{@@gamePlate[1][1]} | #{@@gamePlate[1][2]}
         --+---+--
         #{@@gamePlate[2][0]} | #{@@gamePlate[2][1]} | #{@@gamePlate[2][2]}
        "
    end
    def setCellValue(player, xAxis, yAxis)
        @@gamePlate[yAxis][xAxis] = player == @p1 ? "X" : "O"
    end
    def rowFinished
        for i in 0..@@gamePlate.size-1
            if @@gamePlate[i].uniq.size == 1 && !@@gamePlate[i].include?(" ") then
                return true
                break
            elsif @@gamePlate[i].include?(" ") then
                return false
                break
            end
        end
    end
    def columnFinished
        for i in 0..@@gamePlate.size-1
            checkingArray = []
            checkingArray.push(@@gamePlate[0][i], @@gamePlate[1][i], @@gamePlate[2][i])
            if checkingArray.uniq.size == 1 && !checkingArray.include?(" ") then
                return true
                break
            elsif checkingArray.include?(" ") then
                return false
                break 
            end
        end
    end
    def diagonalFinished
        diagArray1 = [@@gamePlate[0][0], @@gamePlate[1][1], @@gamePlate[2][2]]
        diagArray2 = [@@gamePlate[0][2], @@gamePlate[1][1], @@gamePlate[2][0]]
        diagCondition1 = diagArray1.uniq.size == 1 && !diagArray1.include?(" ") ? true : false
        diagCondition2 = diagArray2.uniq.size == 1 && !diagArray2.include?(" ") ? true : false
        if diagCondition1 || diagCondition2 then
            return true
        elsif diagArray1.include?(" ") || diagArray2.include?(" ") then
            return false
        end
    end
    def isGameFinished
        if rowFinished() || columnFinished() || diagonalFinished() then
            return true
        elsif !rowFinished() || !columnFinished() || !diagonalFinished() then
            return false
        end
    end
end

puts "Player 1's name :"
player1 = gets
puts "Player 2's name :"
player2 = gets
currentGame = Game.new(player1, player2);
turns = 0;
currentPlayer = ""
puts `clear`

while currentGame.isGameFinished() == false do
    puts currentGame.showCurrentTable()
    puts currentGame.showCurrentPlayers()
    if (turns % 2 == 0) then
        currentPlayer = player1;
    else
        currentPlayer = player2;
    end
    print "#{currentPlayer} enter X coordinate:"
    xCoord = gets
    print "#{currentPlayer} enter Y coordinate:"
    yCoord = gets
    currentGame.setCellValue(currentPlayer, xCoord.to_i, yCoord.to_i)
    turns += 1
    puts `clear`
end

puts "#{currentPlayer} won the game !"