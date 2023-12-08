$result = 0
$pair = []
def gettingPairs
    File.open('input.txt', 'r') do |readPointer|
        while newLine = readPointer.gets
            number = newLine.scan(/\d+/)
            pairN = number[0][0].to_s + number[-1][-1].to_s
            $pair.push(pairN)
        end
    end
end
gettingPairs
def sumPairs
    i=0
    while i < $pair.length
        $pair[i] = $pair[i].to_i
        $result = $result + $pair[i]
        i=i+1
    end
end
sumPairs

puts $result