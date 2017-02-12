def kni a, b
  del = a - b
  if (b > del)
    2 * ((b - del) / 3) + del;
  else
    del - 2 * ((del - b) / 4);
  end
end

puts kni 1,2