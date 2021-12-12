input = File.read('day12_input.txt').lines.map {|l| l.scan(/\w+/) }
map = {}
input.each do |k,v|
    map[k] = (map[k] || []).push v
    map[v] = (map[v] || []).push k
end

paths = []
check = [["start"]]
while check.length > 0
    nc = []
    check.each do |path|
        map[path[-1]].each do |opt|
            next if opt == 'start' || (opt != 'end' && opt.downcase == opt && path.include?(opt) && path.tally.filter {|k,v| k.downcase == k }.any? {|k,v| v >= 2 })
            if opt == 'end'
                paths.push(path + [opt])
            else
                nc.push(path + [opt])
            end
        end
    end
    check = nc
end
p paths.filter {|pa| pa.filter {|s| s.downcase == s }.tally.values.all? {|v| v == 1 } }.length
p paths.length
