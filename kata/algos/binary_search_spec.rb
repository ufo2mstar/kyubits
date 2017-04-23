require 'rspec'

class Array
  def binary_search ans
    ary = self
    return if ary.empty?
    len = ary.size-1
    lo = 0; hi = len
    while hi >= lo
      mid = (hi+lo)/2
      poss = ary[mid]
      return mid if poss == ans
      ans > poss ? lo = mid+1 : hi = mid-1
    end
    nil
  end
end

describe "binary_search" do
  context "error checks" do
    it 'returns nil if array is empty' do
      expect([].binary_search(nil)).to eq nil
    end
  end

  let(:ary) {[(-3.0/0),-2,-1,0,1,2,(3.0/0)]}

  context "sample searches" do
    it 'should return nil if not present' do
      expect(ary.binary_search(5)).to eq nil
    end

    it 'should search mid val' do
      expect(ary.binary_search(0)).to eq 3
    end

    it 'should search last val' do
      expect(ary.binary_search(-5.0/0)).to eq 0
    end

    it 'should search first val' do
      expect(ary.binary_search(1.0/0)).to eq 6
    end

    it 'should search rnd val' do
      var = ary.sample
      expect(ary.binary_search(var)).to eq ary.index(var)
    end
  end
end
