input = File.read('day07_input.txt').scan(/\d+/).map(&:to_i)
med = input.sort[input.length/2]
p input.map {|n| (n - med).abs }.sum
avg = (input.sum / (0.0 + input.length)).round
p (avg-50..avg+50).map {|g| input.map {|n| (n-g).abs }.map {|n| n*(n+1)/2 }.sum }.min
