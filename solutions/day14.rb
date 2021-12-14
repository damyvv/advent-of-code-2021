poly = File.read('day14_input.txt').lines[0].strip.chars
tmpl = File.read('day14_input.txt').scan(/(\w+) -> (\w)/).to_h

pairs = poly.each_cons(2).map {|a| a.join }.tally
charr = poly.tally

[10,30].each do |t|
    t.times do
        np = {}
        pairs.each do |pair,cnt|
            charr[tmpl[pair]] = (charr[tmpl[pair]] || 0) + cnt
            np[pair] = (np[pair] || 0) - cnt
            np[pair[0] + tmpl[pair]] = (np[pair[0] + tmpl[pair]] || 0) + cnt
            np[tmpl[pair] + pair[1]] = (np[tmpl[pair] + pair[1]] || 0) + cnt
        end
        pairs.merge!(np) {|k,o,n| o+n }
    end
    p charr.values.minmax.reduce(:-).abs
end
