# Enter your code here. Read input from STDIN. Print output to STDOUT

# gene_length = gets.chomp
# gene = gets.chomp
# gene = "GAAATAAA"
file_name = 'tc4.txt'
gene_length = 0
gene = ""
ans = 0
File.open(file_name, 'r') { |f| gene_length, gene, ans = f.readlines }
puts "len = #{gene_length=gene_length.to_i} , lenn/4 = #{gene_length/4}"


CHARS = %w[A C T G]

def score gene_str
  counts = CHARS.map { |c| gene_str.count c }
  # counts.join '.'
end

def max_back gene_str
  score_ary = score(gene_str)
  [CHARS[score_ary.rindex(score_ary.max)], score_ary.max]
end

def tag_gene(gene_str, wanna_cnt = false) # = binary display
  gene_ary = gene_str.chars
  bin_hsh = {}
  CHARS.each { |c| cnt = 0; bin_hsh[c] = gene_ary.map { |gc| res = gc == c ? 1 : 0; wanna_cnt ? (res == 1 ? cnt+= res : 0) : res } }
  bin_hsh
end

def disp gene_str, wanna_cnt = false # = binary display
  bin_hsh = tag_gene(gene_str, wanna_cnt)
  bin_hsh.each { |c, bin_gene| puts "#{c} : #{bin_gene.join}" }
end

def sub_search gene
  n = gene.length # gene_length
  max_n = n/4
  max_ary = tag_gene(gene, "count")[max_back(gene)[0]]
  rcount = max_ary.rindex(max_n)
  lcount = max_ary.rindex(max_back(gene)[1])
  lcount-rcount
end

def matrix gene
  converged = false
  last_str_len = 0
  until converged do
    gene_hsh = tag_gene(gene, "count")
    n = gene.length # gene_length
    max_n = n/4
    puts "Gene:\ttots\trcount\tlcount"
    gene_hsh.each { |c, gene_ary|
      tots =gene_ary.max
      lcount=gene_ary.rindex(tots)
      rcount=gene_ary.rindex(max_n)||lcount.to_s.gsub(/\d/, '-')
      puts "#{c}\t:\t#{tots}\t#{rcount}\t#{lcount}"
      sub_str_len = sub_search gene
    }
    converged = last_str_len == sub_str_len
    last_str_len = sub_str_len
  end

end

puts score gene
# disp gene
# disp gene, "count"
# disp gene.reverse, "count"
puts sub_search gene
matrix gene

puts ans