$symbols = ["*","#","$","+","@","&","/","%"]
$result = 0

def main
    File.open("input.txt") do |file|
        file.each_line.with_index(1) do |line, indexY|
            $numbersFounded = []
            symbolFound = false
            $symbolsIndexX = []
            line.each_char.with_index do |char, indexX|
                $symbolsIndexX << indexX if /[\/%#$@&*+=-]/.match?(char)
            end
            $y = indexY
            def findNums
                for symbolIndexX in $symbolsIndexX do
                    lines = File.readlines('input.txt')
                    
                    $x = symbolIndexX

                    if $y <= lines.length
                        wantedLine = lines[$y - 1]
                        puts "X: #{$x}, Line #{$y}: #{wantedLine}"
                        if $y > 1
                            #Up
                            if lines[$y-2][$x].scan(/\d+/).length > 0
                                numsArray = []
                                numsArray.push(lines[$y-2][$x])
                                
                                if lines[$y-2][$x-1].scan(/\d+/).length > 0 && lines[$y-2][$x+1].scan(/\d+/).length > 0
                                    numsArray.unshift(lines[$y-2][$x-1])
                                    numsArray.push(lines[$y-2][$x+1])
                                elsif lines[$y-2][$x-1].scan(/\d+/).length > 0
                                    numsArray.unshift(lines[$y-2][$x-1])
                                    if lines[$y-2][$x-2].scan(/\d+/).length > 0
                                        numsArray.unshift(lines[$y-2][$x-2])
                                    end
                                elsif lines[$y-2][$x+1].scan(/\d+/).length > 0
                                    numsArray.push(lines[$y-2][$x+1])
                                    if lines[$y-2][$x+2].scan(/\d+/).length > 0
                                        numsArray.push(lines[$y-2][$x+2])
                                    end
                                end
                                $numbersFounded.push(numsArray.join)
                            else
                                if lines[$y-2][$x-1].scan(/\d+/).length > 0
                                    numsArray = []                                    
                                    numsArray.unshift(lines[$y-2][$x-1])
                                    if lines[$y-2][$x-2].scan(/\d+/).length > 0
                                        numsArray.unshift(lines[$y-2][$x-2])
                                        if lines[$y-2][$x-3].scan(/\d+/).length > 0
                                            numsArray.unshift(lines[$y-2][$x-3])
                                        end
                                    end
                                    $numbersFounded.push(numsArray.join)
                                end
                                if lines[$y-2][$x+1].scan(/\d+/).length > 0
                                    numsArray = []                                    
                                    numsArray.push(lines[$y-2][$x+1])
                                    if lines[$y-2][$x+2].scan(/\d+/).length > 0
                                        numsArray.push(lines[$y-2][$x+2])
                                        if lines[$y-2][$x+3].scan(/\d+/).length > 0
                                            numsArray.push(lines[$y-2][$x+3])
                                        end
                                    end
                                    $numbersFounded.push(numsArray.join)
                                end
                            end
                            #Left
                            if lines[$y-1][$x-1].scan(/\d+/).length > 0
                                numsArray = []
                                numsArray.unshift(lines[$y-1][$x-1])
                                if lines[$y-1][$x-2].scan(/\d+/).length > 0
                                    numsArray.unshift(lines[$y-1][$x-2])
                                    if lines[$y-1][$x-3].scan(/\d+/).length > 0
                                        numsArray.unshift(lines[$y-1][$x-3])
                                    end
                                end
                                $numbersFounded.push(numsArray.join)
                            end
                            #Right
                            if lines[$y-1][$x+1].scan(/\d+/).length > 0
                                numsArray = []
                                numsArray.push(lines[$y-1][$x+1])
                                if lines[$y-1][$x+2].scan(/\d+/).length > 0
                                    numsArray.push(lines[$y-1][$x+2])
                                    if lines[$y-1][$x+3].scan(/\d+/).length > 0
                                        numsArray.push(lines[$y-1][$x+3])
                                    end
                                end
                                $numbersFounded.push(numsArray.join)
                            end
                            #Down
                            if lines[$y][$x].scan(/\d+/).length > 0
                                numsArray = []
                                numsArray.push(lines[$y][$x])
                                if lines[$y][$x-1].scan(/\d+/).length > 0 && lines[$y][$x+1].scan(/\d+/).length > 0
                                    numsArray.unshift(lines[$y][$x-1])
                                    numsArray.push(lines[$y][$x+1])
                                elsif lines[$y][$x-1].scan(/\d+/).length > 0
                                    numsArray.unshift(lines[$y][$x-1])
                                    if lines[$y][$x-2].scan(/\d+/).length > 0
                                        numsArray.unshift(lines[$y][$x-2])
                                    end
                                elsif lines[$y][$x+1].scan(/\d+/).length > 0
                                    numsArray.push(lines[$y][$x+1])
                                    if lines[$y][$x+2].scan(/\d+/).length > 0
                                        numsArray.push(lines[$y][$x+2])
                                    end
                                end
                                $numbersFounded.push(numsArray.join)
                            else
                                if lines[$y][$x-1].scan(/\d+/).length > 0
                                    numsArray = []
                                    numsArray.unshift(lines[$y][$x-1])
                                    if lines[$y][$x-2].scan(/\d+/).length > 0
                                        numsArray.unshift(lines[$y][$x-2])
                                        if lines[$y][$x-3].scan(/\d+/).length > 0 && $x > 0
                                            numsArray.unshift(lines[$y][$x-3])
                                        end
                                    end
                                    $numbersFounded.push(numsArray.join)
                                end
                                if lines[$y][$x+1].scan(/\d+/).length > 0
                                    numsArray = []
                                    numsArray.push(lines[$y][$x+1])
                                    if lines[$y][$x+2].scan(/\d+/).length > 0
                                        numsArray.push(lines[$y][$x+2])
                                        if lines[$y][$x+3].scan(/\d+/).length > 0
                                            numsArray.push(lines[$y][$x+3])
                                        end
                                    end
                                    $numbersFounded.push(numsArray.join)
                                end
                            end
                        end
                    else
                        puts "This line doesn't exist in the file"
                    end
                end
            end
            if $symbolsIndexX.length > 0
                symbolFound = true
            end
            if symbolFound == true
                findNums
            end
            for numFounded in $numbersFounded do
                puts "Number Founded: #{numFounded}"
                $result += numFounded.to_i
            end
        end
    end
end
main

puts "Result: #{$result}"