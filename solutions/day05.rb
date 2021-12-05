input = File.read('day05_input.txt').lines.map {|l| l.scan(/(\d+),(\d+)/).map {|p| p.map(&:to_i)} }
st = input.filter {|l| l[0][0] == l[1][0] || l[0][1] == l[1][1] }
places = []
st.each do |r|
    Range.new(*r.transpose[0].sort).each do |x|
        Range.new(*r.transpose[1].sort).each do |y|
            places.push([x,y])
        end
    end
end
p places.tally.count {|k,v| v > 1 }
(input - st).each do |r|
    r = r.transpose
    (0..r[0].reverse.reduce(:-).abs).each do |i|
        places.push [(r[0][0] > r[0][1] ? r[0][0] - i : r[0][0] + i),
                     (r[1][0] > r[1][1] ? r[1][0] - i : r[1][0] + i)]
    end
end
p places.tally.count {|k,v| v > 1 }
