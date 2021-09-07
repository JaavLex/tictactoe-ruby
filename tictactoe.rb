class Game
    @@gamePlate = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
    ]
    def initialize(player1, player2)
        @turn = 0
        @p1 = player1
        @p2 = player2
    end
    def showTitle()
        puts "
            _______ _   _______      _______         
            |__   __(_) |__   __|    |__   __|        
               | |   _  ___| | __ _  ___| | ___   ___ 
               | |  | |/ __| |/ _` |/ __| |/ _ \\ / _ \\
               | |  | | (__| | (_| | (__| | (_) |  __/
               |_|  |_|\\___|_|\\__,_|\\___|_|\\___/ \\___|                                         
        "
    end
    def showCurrentPlayers()
        puts "
                        | #{@p1} -vs- #{@p2} |
        "
    end
    def showCurrentTable()
        puts "
                             0   1   2
                             -   -   -  
                         0 | #{@@gamePlate[0][0]} | #{@@gamePlate[0][1]} | #{@@gamePlate[0][2]} |
                             --+---+--
                         1 | #{@@gamePlate[1][0]} | #{@@gamePlate[1][1]} | #{@@gamePlate[1][2]} | Y
                             --+---+--
                         2 | #{@@gamePlate[2][0]} | #{@@gamePlate[2][1]} | #{@@gamePlate[2][2]} |
                             -   -   -
                                 X
        "
    end
    def setCellValue(player, xAxis, yAxis)
        @@gamePlate[yAxis][xAxis] = player == @p1 ? "X" : "O"
    end
    def rowFinished()
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
    def columnFinished()
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
    def diagonalFinished()
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
    def isGameFinished()
        if rowFinished() || columnFinished() || diagonalFinished() then
            return true
        elsif !rowFinished() || !columnFinished() || !diagonalFinished() then
            return false
        end
    end
    def nextTurn()
        @turn += 1
    end
    def getTurn()
        return turn
    end
    def getCurrentPlayer()
        return @turn % 2 == 0 ? @p1 : @p2
    end
end

puts `clear`
isWon = false
print "Player 1's name: "
player1 = gets
print "Player 2's name: "
player2 = gets
tttGame = Game.new(player1.chomp, player2.chomp);
puts `clear`
loop do   
    puts tttGame.showTitle()
    puts tttGame.showCurrentTable()
    puts tttGame.showCurrentPlayers()
    print "#{tttGame.getCurrentPlayer()} enter X coordinate: "
    xCoord = gets
    print "#{tttGame.getCurrentPlayer()} enter Y coordinate: "
    yCoord = gets
    tttGame.setCellValue(tttGame.getCurrentPlayer(), xCoord.to_i, yCoord.to_i)
    isWon = tttGame.isGameFinished()
    tttGame.nextTurn()
    puts `clear`  
   break if isWon == true
end

puts "#{tttGame.getCurrentPlayer()} won the game !"