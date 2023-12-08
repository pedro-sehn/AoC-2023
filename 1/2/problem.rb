$numStrings = {
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
}

$pairs = []

def getPairs
    File.open("input.txt") do |file|
        file.each_line do |line|
            $numStrings.each do |key, value|
                line.gsub!(key, value.to_s)
            end
            number = line.scan(/\d+/)
            pairN = number[0][0].to_s + number[-1][-1].to_s
            $pairs.push(pairN)
        end
    end
end
getPairs

result = $pairs.map(&:to_i).sum
puts result