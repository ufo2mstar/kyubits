require 'rspec'
require_relative 'mat_spiral_print'

describe "print spiral" do

  it "prints a 3 x 5 normal ary" do
    mat = [(1..5).to_a, (6..10).to_a, (11..15).to_a]
    p mat
    p mat.size
    p mat[0].size
    res = spiral_print mat
    expect(res).to eq [1, 2, 3, 4, 5, 10, 15, 14, 13, 12, 11, 6, 7, 8, 9]
  end

  it "prints a 1 x 5 col vector" do
    mat = [(1..5).to_a]
    p mat
    p mat.size
    p mat[0].size
    res = spiral_print mat
    expect(res).to eq [1, 2, 3, 4, 5]
  end

  it "prints a 5 x 1 col vector" do
    mat = [(1..5).to_a].transpose
    p mat
    p mat.size
    p mat[0].size
    res = spiral_print mat
    expect(res).to eq [1, 2, 3, 4, 5]
  end

  it "prints a 1 x 1 ary" do
    mat = [[1]]
    p mat
    p mat.size
    p mat[0].size
    res = spiral_print mat
    expect(res).to eq [1]
  end

  it "prints a 0 x 0 ary" do
    mat = [[]]
    p mat
    p mat.size
    p mat[0].size
    res = spiral_print mat
    expect(res).to eq []
  end
end
