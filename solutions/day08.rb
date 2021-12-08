input = File.read('day08_input.txt').lines.map {|l| l.split('|').map(&:strip).map {|s| s.split(' ') } }
p input.map {|s| s[1].map(&:length).filter {|i| [2,3,4,7].include? i }.count }.sum

p input.map { |sig,out|
    sig.sort_by! {|s| s.length}.map! {|s| s.chars.sort.join }
    d = {1 => sig[0], 4 => sig[2], 7 => sig[1], 8 => sig[9]}
    d[2], d[5], d[3] = (sig - d.values).filter {|s| s.length == 5 }
        .sort_by {|s| [s.chars.intersection(d[1].chars).length, s.chars.intersection(d[4].chars).length] }
    d[6], d[0], d[9] = (sig - d.values).sort_by {|s| [s.chars.intersection(d[1].chars).length, s.chars.intersection(d[4].chars).length] }
    out.map { |o| d.key(o.chars.sort.join).to_s }.join.to_i
}.sum
