input = File.read('day03_input.txt').lines.map {|l| l.strip.chars }
p input.transpose.map {|v| v.tally.sort_by{|k,v| v }.map{|a| a[0] } }.transpose.map{|a| a.join.to_i(2) }.reduce(:*)
min = max = ""
(0..input[0].length-1).each do |i|
    max += input.filter {|v| v.join.start_with?(max) }.transpose.map {|v| v.tally.max_by{|k,v| [v,k] }[0] }[i]
    min += input.filter {|v| v.join.start_with?(min) }.transpose.map {|v| v.tally.min_by{|k,v| [v,k] }[0] }[i]
end
p max.to_i(2)*min.to_i(2)
