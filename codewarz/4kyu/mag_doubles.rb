def doubles(maxk, maxn)
  v =-> k, n { 1.0 / (k*(n+1)**(2*k)) }
  u =-> kk, nn { sum = 0; (1..kk).each{|k|(1..nn).each{|n| sum+=v[k,n]}}; sum}
  u[maxk, maxn]
end


puts doubles(1, 10)
puts '0.5580321939764581'

#
# $r = Random.new
#
# def assertFuzzyEquals(actual, expected)
#   merr = 1e-6
#   inrange = (actual - expected).abs <= merr
#   if (inrange == false) then
#     msg = "At 1e-6: Expected value must be %.6f but was %.6f" % [expected, actual]
#   end
#   return Test.expect(inrange, msg)
# end
#
# # tests results are given with lots of decimals but tested at 1e-6
#
# Test.describe("doubles") do
#   Test.it("Basic tests") do
#     assertFuzzyEquals(doubles(1, 10), 0.5580321939764581)
#     assertFuzzyEquals(doubles(10, 1000), 0.6921486500921933)
#     assertFuzzyEquals(doubles(10, 10000), 0.6930471674194457)
#     assertFuzzyEquals(doubles(20, 10000), 0.6930471955575918)
#   end
# end
