FIXNUM_MAX = (2**(0.size * 8 -2) -1)
FIXNUM_MIN = -(2**(0.size * 8 -2))
#
# In ruby Fixnums are automatically converted to Bignums.
#
# To find the highest possible Fixnum you could do something like this:

class Fixnum
 N_BYTES = [42].pack('i').size
 N_BITS = N_BYTES * 8
 MAX = 2 ** (N_BITS - 2) - 1
 MIN = -MAX - 1
end
p(Fixnum::MAX)

# Shamelessly ripped from a ruby-talk discussion. Look there for more details.
#
#     http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/149748
#
# https://stackoverflow.com/questions/535721/ruby-max-integer
