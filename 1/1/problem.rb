$pairs = []

def getPairs
    File.open("input.txt") do |file|
        file.each_line do |line|
            numbers = line.scan(/\d+/)
            pairN = numbers[0][0].to_s + numbers[-1][-1].to_s
            $pairs.push(pairN)
        end
    end
end
getPairs

result = $pairs.map(&:to_i).sum
puts "Result: #{result}"