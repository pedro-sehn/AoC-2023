$result = 0

def checkBags
    def getBiggestNum(arr)
        biggestNum = nil
        biggestDigitFounded = -1
    
        arr.each do |num|
            absNum = num.to_i.abs
            while absNum > 0
              if num.to_i.abs > biggestDigitFounded
                biggestDigitFounded = num.to_i.abs
                biggestNum = num.to_i
              end
              absNum = absNum / 10
            end
        end
        return biggestNum
    end
      
    File.open("input.txt") do |file|
        file.each_line do |line|
            $arrayRed=[]
            $arrayGreen=[]
            $arrayBlue=[]
            
            $gameId = line.match(/(\d+)/)
            line.gsub!(/Game (\d+): /, "")
            reds = line.scan(/\d+ red/)
            reds.each do |red|
                $arrayRed.push(red)
            end
            greens = line.scan(/\d+ green/)
            greens.each do |green|
                $arrayGreen.push(green)
            end
            blues = line.scan(/\d+ blue/)
            blues.each do |blue|
                $arrayBlue.push(blue)
            end
            puts ""
            puts "Red: #{$arrayRed}"
            puts "Green: #{$arrayGreen}"
            puts "Blue: #{$arrayBlue}"

            biggestRedNum = getBiggestNum($arrayRed)
            biggestGreenNum = getBiggestNum($arrayGreen)
            biggestBlueNum = getBiggestNum($arrayBlue)

            $result += biggestRedNum*biggestGreenNum*biggestBlueNum
        end
    end
end
checkBags


puts "Result: #{$result}"