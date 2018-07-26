require 'rspec'
require_relative 'real_test'

# 12 other tests
describe "demo_01" do
  context "8 houses cases" do
    it '1e41e2' do
      ary = [1, 0, 0, 0, 0, 1, 0, 0]
      days = 1
      res = cellCompete ary, days
      expect(res).to eq [0, 1, 0, 0, 1, 0, 1, 0]
    end
    it '311041' do
      ary = [1, 1, 1, 0, 1, 1, 1, 1]
      days = 2
      res = cellCompete ary, days
      expect(res).to eq [0, 0, 0, 0, 0, 1, 1, 0]
    end
  end
end

# 13 other tests
describe "demo_02" do
  context "gcd ary" do
    it '1' do
      ary = [2, 3, 4, 5, 6]
      res = generalizedGCD 0, ary
      expect(res).to eq 1
    end
    it '2' do
      ary = [2, 4, 6, 8, 10]
      res = generalizedGCD 0, ary
      expect(res).to eq 2
    end
  end
end


# 17 other tests
describe "real_01" do
  context "text exclusion" do
    it 'hack' do
      ary = ["and", "the", "kod"]
      text = "Each of the next  lines contains a single query in the form described in the problem statement above. All queries start with an integer denoting the query , but only query  is followed by an additional space-separated value, lines lines , denoting the value to be enqueued."
      res = most_frequently_used_words text, ary
      expect(res).to eq ["lines", "query"]
    end
    it '311041' do
      ary = ["thou", "where", "art"]
      text = "romeo romeo romeo where art thou romeo"
      res = most_frequently_used_words text, ary
      expect(res).to eq ["romeo"]
    end
  end
end

# 23 other tests
describe "real_02" do
  context "lines check" do
    it '1e41e2' do
      ary = [
          "r3 abc def ghi",
          "k22 abc def ghi",
          "ldp3 2 323 3453 22",
          "k23 sd ffds lj",
          "eid mubarak",
      ]
      res = reorder_lines ary.size, ary
      expect(res).to eq ["k22 abc def ghi", "r3 abc def ghi", "eid mubarak", "k23 sd ffds lj","ldp3 2 323 3453 22"]
    end

  end
end
