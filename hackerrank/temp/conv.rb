def convert_temp(temp, **opts)
  scale_hsh = {'celsius': :c, 'kelvin': :k, 'fahrenheit': :f}
  inp, out = scale_hsh[opts[:input_scale]], scale_hsh[opts[:output_scale]]
  case inp
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


puts convert_temp(0, input_scale: 'celsius', output_scale: 'kelvin')
puts convert_temp(0, input_scale: 'celsius', output_scale: 'fahrenheit')