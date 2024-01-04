$idsApproved=[]

def checkBags
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
            def approveGameId
                redLength = $arrayRed.length
                greenLength = $arrayGreen.length
                blueLength = $arrayBlue.length
                
                redCounter = 0
                greenCounter = 0
                blueCounter = 0
                
                approved = false

                stop = false
                if stop != true
                    for element in $arrayRed do
                        elementNum = element.scan(/\d+/)
                        
                        if elementNum[0].to_i > 12
                            stop = true
                        else
                            redCounter=redCounter+1
                        end
                    end
                    for element in $arrayGreen do
                        elementNum = element.scan(/\d+/)
                        
                        if elementNum[0].to_i > 13
                            stop = true
                        else
                            greenCounter=greenCounter+1
                        end
                    end
                    for element in $arrayBlue do
                        elementNum = element.scan(/\d+/)
                        
                        if elementNum[0].to_i > 14
                            stop = true
                        else
                            blueCounter=blueCounter+1
                        end
                    end
                end
                if redCounter == redLength && greenCounter == greenLength && blueCounter == blueLength
                    approved = true
                end
                if approved == true
                    $idsApproved.push($gameId)
                end
            end
            approveGameId
        end
    end
end
checkBags

result = $idsApproved.map{|match_data|match_data[1].to_i }.sum
puts "Result: #{result}"