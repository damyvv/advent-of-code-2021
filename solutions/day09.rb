input = File.read('day09_input.txt').lines.map {|l| l.strip.chars.map(&:to_i) }
h = input.map {|l| ([9]+l+[9]).each_cons(3).map {|w| w.tally[w.min] == 1 && w.min == w[1] ? w[1]+1 : 0 } }
v = input.transpose.map {|l| ([9]+l+[9]).each_cons(3).map {|w| w.tally[w.min] == 1 && w.min == w[1] ? w[1]+1 : 0 } }.transpose
mins = []
(0..h.size-1).each {|y| [h[y],v[y]].transpose.each_with_index {|a,x| mins.push [x,y] if a[0] == a[1] && a[0] > 0 } }
p mins.map {|x,y| h[y][x] }.sum

p mins.map { |x,y|
    to_check, checked, basin = [[x,y]], [], []
    while to_check.size > 0
        to_check.each do |xx,yy|
            checked.push [xx,yy]
            next if xx < 0 || yy < 0 || yy >= input.size || xx >= input[0].size || input[yy][xx] == 9
            basin.push [xx,yy]
            to_check += [ [xx,yy-1], [xx,yy+1], [xx-1,yy], [xx+1,yy] ]
        end
        to_check = to_check.uniq - checked
    end
    basin.sort
}.uniq.map {|b| b.size }.sort[-3..].reduce(:*)
