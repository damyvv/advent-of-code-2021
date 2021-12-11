input = File.read('day11_input.txt').lines.map {|l| l.strip.chars.map(&:to_i) }

flashes = 0
t = 0
loop do
    t += 1
    flash = []
    nfs = flashes
    (0..9).each do |y|
        (0..9).each do |x|
            input[y][x] += 1
            flash.push [y,x] if input[y][x] > 9
        end
    end
    while flash.length > 0
        nf = []
        flash.each do |y,x|
            (-1..1).each do |yy|
                (-1..1).each do |xx|
                    next if (yy == xx && xx == 0) || y+yy < 0 || x+xx < 0 || y+yy > 9 || x+xx > 9
                    input[y+yy][x+xx] += 1
                    nf.push [y+yy, x+xx] if input[y+yy][x+xx] == 10
                end
            end
        end
        flash = nf
    end
    (0..9).each do |y|
        (0..9).each do |x|
            if input[y][x] > 9
                input[y][x] = 0
                nfs += 1
            end
        end
    end
    break if nfs - flashes == 100
    flashes = nfs
    p flashes if t == 100
end
p t
