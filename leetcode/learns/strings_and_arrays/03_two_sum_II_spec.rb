require 'rspec'
require_relative '03_two_sum_II'

describe 'idx return' do
  it 'should run simple test' do
    inp = [2,7,11,15]
    target = 9
    res = two_sum inp,target
    expect(res).to eq [1,2]
  end

  it 'should run simple test' do
    inp = [2,3,4]
    target = 6
    res = two_sum inp,target
    expect(res).to eq [1,3]
  end
end
