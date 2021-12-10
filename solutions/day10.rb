input = File.read('day10_input.txt').lines.map(&:strip)

score = { nil => 0, ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }
p input.map! { |l|
    while ((n = l.gsub(/(\(\)|\[\]|{}|<>)/, '')).length != l.length)
        l = n
    end
    l
}.inject(0) {|s,l| s + score[l[/(\)|\]|}|>)/]] }

m = { '{' => '}', '<' => '>', '(' => ')', '[' => ']' }
score = { ')' => 1, ']' => 2, '}' => 3, '>' => 4 }
res = input.filter {|l| l[/(\)|\]|}|>)/] == nil }.map { |l|
    s = 0
    while l.length > 0
        s = s*5 + score[m[l[-1]]]
        l += m[l[-1]]
        while ((n = l.gsub(/(\(\)|\[\]|{}|<>)/, '')).length != l.length)
            l = n
        end
    end
    s
}
p res.sort[res.length / 2]
