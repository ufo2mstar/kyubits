require 'rspec'
require_relative 'recursive_bin_search'

def run_bin l, r, x, exp
  ary = (l..r).to_a
  puts "Running: (#{ary}) -> x = #{x}"
  res = bin_compare(ary, x)
  expect(res).to eq exp
end

def bin_compare nums, x
  left, right = 0, nums.size - 1
  # t1 = bin1 nums, left, right, x
  t1, left1, right1 = binary_search nums, left, right, x
  # puts "mid1 = #{t1}, start ( left=#{left}, right=#{right} ) -> left_res=#{left1}, right_res=#{right1}"
  puts "mid = #{t1}"
  t1
end

describe :bin_compare do
  context "simple" do
    it 'should print res' do
      run_bin 0, 10, 5, 5
    end
    it 'should print -1' do
      run_bin 0, 10, 11, -1
    end

    context "more involved" do
      it 'should print res' do
        run_bin 10, 100, 33, 23
      end
    end
  end
end
