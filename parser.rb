require 'json'

puts "Enter JSON-like hash"

response = gets.chomp
semi_to_rocket = response.gsub('=>', ':', )
json_compatible_string = semi_to_rocket.gsub(/\bnil\b/, 'null')

begin
  parsed_json = JSON.parse(json_compatible_string)
rescue JSON::ParseError => e
  puts "JSON Parse Error #{e.message}"
  exit
end

json_output = JSON.pretty_generate(parsed_json)
puts json_output