# Journey to the moon
# Japan

def d(h, i, a)
  puts h, i, a
  return a.keys if a[i]
  a[i] = true
  unless h[i].nil?
    h[i].each do |j|
      d(h, j, a)
    end
    h.delete(i)
  end
  a.keys
end

n, i = gets.split(' ').map(&:to_i)

h = {}
i.times do
  a, b = gets.split(' ').map(&:to_i)
  h[a] ||= []
  h[a].push(b)
  h[b] ||= []
  h[b].push(a)
end

groups = []

diff = n
t
until h.empty?
  group = d(h, h.first.first, {})
  puts group.inspect
  groups.push(group)
  diff -= group.size
end

ans = 0
groups.combination(2) do |a, b|
  ans += a.size * b.size
end
groups.each do |g|
  ans += g.size * diff
end
ans += diff * (diff-1)/2 if diff > 1
puts ans
  
#China

class UnionFindSet
  def initialize(n)
    @f = Array.new(n)
    for i in 0..n
      @f[i] = i
    end
  end
  
  def find(x)
    return x if x == @f[x]
    @f[x] = find(@f[x])
  end
  
  def union(x, y)
    fx, fy = find(x), find(y)
    return if fx = fy
    @f[fx] = fy
  end
  
  def res
    h = @f.inject(Hash.new(0)){ |hash, i| hash[find(i)] += 1; hash}
    v = h.values
    s = Array.new(v.length)
    s[0] = v[0]
    for i in 1..v.length
      s[i] = s[i - 1] + v[i]
    end
    res = 0
    for i in 0...(v.length - 1)
      res += v[i + 1] * s[i]
    end
    res
  end
end

n, i = gets.split.map{ |x| x.to_i }
ufs = UnionFindSet.new(n)
for _ in 1..i
  x, y = gets.split.map{ |x| x.to_i }
  ufs.union(x, y)
end

puts ufs.res

# USA
require 'set'
N, I = gets.split(" ").map{ |v| v.to_i }
list_of_sets = []

I.times do
  a, b = gets.split(" ").map{ |v| v.to_i }
  new_set = Set.new []
  set_len = list_of_sets.length
  s = 0
  while s < set_len 
    if list_of_sets[s].include?(a) or list_of_sets[s].include?(b)
      new_set = new_set | list_of_sets[s]
      list_of_sets.delete_at(s)
      set_len -= 1
    else
      s += 1
    end
  end
  new_set = new_set | [a,b]
  list_of_tests << new_set
end

answers = N*(N-1)/2
list_of_sets.each{ |set| answer -= set.length*(set.length -1 )/2 }
puts answers
