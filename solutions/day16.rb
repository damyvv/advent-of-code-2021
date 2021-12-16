input = File.read('day16_input.txt').strip
binary = input.chars.map {|c| c.to_i(16).to_s(2).rjust(4,'0') }.join

def parse_packet(binary)
    version,type = binary[0..2].to_i(2), binary[3..5].to_i(2)
    if type == 4
        lit = ''
        k = 6
        loop do
            lit += binary[k+1..k+4]
            k += 5
            break if binary[k-5] == '0'
        end
        lit = lit.to_i(2)
        { version: version, type: type, value: lit, consumed: k }
    else
        ltype = binary[6].to_i(2)
        if ltype == 1
            length = binary[7..17].to_i(2)
            k = 18
            packs = []
            length.times do
                packs.push parse_packet(binary[k..])
                k += packs[-1][:consumed]
            end
            { version: version, type: type, value: packs, consumed: k }
        else
            length = binary[7..21].to_i(2)
            substr = binary[22..22+length-1]
            packs = []
            while substr.length > 0
                packs.push parse_packet(substr)
                substr = substr[packs[-1][:consumed]..]
            end
            { version: version, type: type, value: packs, consumed: 22+length }
        end
    end
end

def sum_version(packet)
    if packet[:value].is_a?(Array)
        packet[:version] + packet[:value].sum {|e| sum_version(e) }
    else
        packet[:version]
    end
end

packet = parse_packet(binary)
p sum_version(packet)

def extract_value(packet)
    return packet[:value] if packet[:type] == 4
    values = packet[:value].map {|e| extract_value(e) }
    case packet[:type]
    when 0 then values.sum
    when 1 then values.reduce(:*)
    when 2 then values.min
    when 3 then values.max
    when 5 then (values[0] >  values[1] ? 1 : 0)
    when 6 then (values[0] <  values[1] ? 1 : 0)
    when 7 then (values[0] == values[1] ? 1 : 0)
    end
end

p extract_value(packet)
