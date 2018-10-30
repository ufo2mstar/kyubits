require 'rspec'
require_relative '1_three_template_probe'

def run_bin n, x
  ary = (0..n).to_a
  puts "Running: (#{ary[0]}..#{ary[-1]}) -> x = #{x}"
  res = bin_compare(ary, x)
  expect(res).to eq nil
end

describe :bin_compare do
  context "Template 1" do
    it 'should print res' do
      run_bin 10, 5
    end
    it 'should print res' do
      run_bin 100, 5
    end
    it 'should print res' do
      run_bin 100, 55
    end
    it 'should print res' do
      run_bin 100, 95
    end

  end

end
