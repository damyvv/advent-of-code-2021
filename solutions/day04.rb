nums, *cards = File.read('day04_input.txt').split("\n\n")
nums = nums.split(',').map(&:to_i)
cards = cards.map {|c| (c.lines.map {|l| l.scan(/\d+/).map(&:to_i) }) }
cards = cards.map {|c| [c, c.transpose] }

cp1 = Marshal.load(Marshal.dump(cards))
nums.each do |n|
    break if cp1.any? {|c| c.any? {|t| t.any? {|l| l.empty? } } }
    cp1.each {|c| c.each {|t| t.each {|l| l.delete(n) } } }
    $n = n
end
p $n*cp1.filter {|c| c.any? {|t| t.any? {|l| l.empty? } } }[0][0].flatten.sum

nums.each do |n|
    break if cards.count {|c| c.all? {|t| t.all? {|l| !l.empty? } } } <= 1
    cards.each {|c| c.each {|t| t.each {|l| l.delete(n) } } }
    $n = n
end
c = cards.filter {|c| c.all? {|t| t.all? {|l| !l.empty? } } }[0]
nums.each do |n|
    break if c.any? {|t| t.any? {|l| l.empty? } }
    cards.each {|c| c.each {|t| t.each {|l| l.delete(n) } } }
    $n = n
end
p $n*c[0].flatten.sum
