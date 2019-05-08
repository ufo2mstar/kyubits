str = `netsh wlan show profile`
profile_names = []
str.scan(/^.*Profile\s+: (.*)$/) {|x| profile_names << x[0]}
wifi_profiles = {}
nil_wifi_profiles = []
profile_names.each do |name|
  cmd = "netsh wlan show profile name=#{name} key=clear"
  str = `#{cmd}`
  pswd = str[/^\s+Key Content\s+: (.*)$/, 1]
  pswd ? wifi_profiles[name] = pswd : nil_wifi_profiles << name
end
require 'ap'
puts "{ \tProfile => Password\t }"
ap wifi_profiles
puts "\nNo Passwords found for Profiles"
ap nil_wifi_profiles
