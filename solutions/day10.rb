input = File.read('day10_input.txt').lines.map(&:strip)

score = { nil => 0, ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }
p input.map! { |l|
    while ((n = l.gsub(/(\(\)|\[\]|{}|<>)/, '')).length != l.length)
        l = n
    end
    l
}.inject(0) {|s,l| s + score[l[/(\)|\]|}|>)/]] }

score = { '(' => 1, '[' => 2, '{' => 3, '<' => 4 }
res = input.filter {|l| l[/(\)|\]|}|>)/] == nil }.map { |l| l.chars.reverse.inject(0) {|s,c| s*5+score[c] } }
p res.sort[res.length / 2]
