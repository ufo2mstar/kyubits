require 'rspec'
require_relative '04_rem_elem'

describe 'pass' do
  it 'should return new small ary' do
    inp = [3,2,2,3]
    res = remove_element inp,3
    expect(res).to eq 2
    expect(inp[0..res-1]).to eq [2,2]
  end
end
