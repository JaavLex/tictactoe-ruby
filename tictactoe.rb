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
    def checkRow
        for i in 0..@@gamePlate.size-1
            if @@gamePlate[i].uniq.size == 1 && !@@gamePlate[i].include?(" ") then
                puts "A player won"
                break
            elsif @@gamePlate[i].include?(" ") then
                puts "Unfinished"
            else
                puts "Indecisive" 
            end
        end
    end
    def checkColumn
        for i in 0..@@gamePlate.size-1
            checkingArray = []
            checkingArray.push(@@gamePlate[0][i], @@gamePlate[1][i], @@gamePlate[2][i])
            if checkingArray.uniq.size == 1 && !checkingArray.include?(" ") then
                puts "A player won"
                break
            elsif checkingArray.include?(" ") then
                puts "Unfinished"
            else
                puts "Indecisive" 
            end
        end
    end
end

test = Game.new("Abdul", "Mamadou")

test.setCellValue("Abdul", 0, 0)
test.setCellValue("Abdul", 1, 0)
test.setCellValue("Abdul", 2, 0)
test.checkColumn()