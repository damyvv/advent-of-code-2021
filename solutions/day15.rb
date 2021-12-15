require 'set'

input = File.read('day15_input.txt').lines.map {|l| l.strip.chars.map(&:to_i) }

def find_cost(pcost, pend)
    pcst = { [0,0] => 0 }
    visited = Set[]
    fin = false
    until fin
        pos,cost = pcst.min_by {|k,v| v }
        visited.add pos
        [[-1,0],[1,0],[0,-1],[0,1]].map {|y,x| [pos[0]+y, pos[1]+x] }.each do |y,x|
            next if y < 0 || x < 0 || y > pend[0] || x > pend[0]
            next if visited.include? [y,x]
            nc = cost + pcost[y][x]
            pcst[[y,x]] = [(pcst[[y,x]] || nc), nc].min
            fin = true if [y,x] == pend
        end
        pcst.delete(pos)
    end
    pcst[pend]
end

p find_cost(input,[input.length-1, input[0].length-1])

input2 = Array.new(input.length*5) { |y|
    Array.new(input[0].length*5) { |x|
        risk = input[y % input.length][x % input[0].length] + y/input.length + x/input[0].length
        risk % 10 + risk/10
    }
}

# NOTE: part 2 is slow. Takes around 25 seconds.
p find_cost(input2,[input2.length-1, input2[0].length-1])
