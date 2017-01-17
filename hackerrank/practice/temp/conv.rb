def convert_temp(temp, **opts)
  scale_hsh = {'celsius' => :c, 'kelvin' => :k, 'fahrenheit' => :f}
  inp, out = scale_hsh[opts[:input_scale]], scale_hsh[opts[:output_scale]]|| :c
  puts case inp
    when :c
      case out
        when :k
          temp + 273.15
        when :f
          (temp * 9.0 / 5)+ 32
      end
    when :k
      case out
        when :c
          temp - 273.15
        when :f
          (temp * 9.0 / 5) - 459.67
      end
    when :f
      case out
        when :k
          (temp - 32) * 5.0/9
        when :c
          (temp + 459.67) * 5.0/9
      end
  end
end


convert_temp(0, input_scale: 'kelvin')
convert_temp(0, input_scale: 'fahrenheit')
convert_temp(0, input_scale: 'celsius', output_scale: 'fahrenheit')
convert_temp(-273.15, input_scale: 'celsius', output_scale: 'fahrenheit')
convert_temp(477.5944444444445, input_scale: 'celsius', output_scale: 'fahrenheit')
convert_temp(167.22222222222223, input_scale: 'celsius', output_scale: 'fahrenheit')
convert_temp(119.85000000000002, input_scale: 'celsius', output_scale: 'fahrenheit')