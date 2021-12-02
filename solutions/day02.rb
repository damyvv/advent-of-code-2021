input = File.read('day02_input.txt').scan(/^([fdu]).*?(\d*)$/).map {|d,v| d == 'u' ? ['d', -v.to_i] : [d, v.to_i] }
p input.inject({'d'=>0, 'f'=>0}) {|h,k| h[k[0]] += k[1]; h }.values.reduce(:*)
p input.inject({'d'=>0, 'f'=>0, 'k'=>0}) {|h,k| h['k'] += h['d']*k[1] if k[0] == 'f'; h[k[0]] += k[1]; h }.reject{|k,v|k=='d'}.values.reduce(:*)
