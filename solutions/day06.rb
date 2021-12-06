input = File.read('day06_input.txt').scan(/\d+/).map(&:to_i)
[80, 256].each do |days|
    count = Array.new(9,0)
    input.each {|i| count[i] += 1 }
    days.times do
        count[7] += count[0]
        count = count.rotate(1)
    end
    p count.sum
end
