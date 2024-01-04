$numStringsOnetoNine = {
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
$numStringsNinetoOne = {
    "nine" => 9,
    "eight" => 8,
    "seven" => 7,
    "six" => 6,
    "five" => 5,
    "four" => 4,
    "three" => 3,
    "two" => 2,
    "one" => 1
}

$pairs = []

def getPairs
    File.open("input.txt") do |file|
        file.each_line do |line|
            $numStringsOnetoNine.each do |key, value|
                $numStringsNinetoOne.each do |key, value|
                    preLine = line.gsub!(key, value.to_s)
                end
                if line.include?key[0..-2]
                    line.gsub!(key[0..-2], value.to_s)
                end
                if line.include?key[1..-1]
                    line.gsub!(key[1..-1], value.to_s)
                end
            end
            numbers = line.scan(/\d+/)
            pairN = numbers[0][0].to_s + numbers[-1][-1].to_s
            $pairs.push(pairN)
        end
    end
end
getPairs

result = $pairs.map(&:to_i).sum
puts "Result: #{result}"