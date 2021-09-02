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
        puts "Current players: #@p1 - vs - #@p2"
    end
    def showCurrentTable
        puts "- Game in Progress - "
        puts "#@@gamePlate"
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
end

test = Game.new("Abdul", "Mamadou")

test.setCellValue("Mamadou", 0, 0)
test.setCellValue("Abdul", 0, 2)
test.setCellValue("Mamadou", 1, 1)
test.setCellValue("Mamadou", 2, 2)
test.setCellValue("Abdul", 2, 0)
test.showCurrentTable()
puts test.diagonalFinished()