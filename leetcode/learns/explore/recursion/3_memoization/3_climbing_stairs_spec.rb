require 'rspec'
require_relative '3_climbing_stairs'

describe 'static steps' do
  it 'should compute out' do
    inp = 7
    res = climb_stairs_rec inp
    expect(res).to eq 21
  end
end
