require 'json'

puts "Enter JSON-like hash"

# Store standard input
response = gets.chomp

# Create new string with rockets replaced with semicolons
semi_to_rocket = response.gsub('=>', ':', )

# Create new string with nil converted to null, only if it's a standalone
json_compatible_string = semi_to_rocket.gsub(/\bnil\b/, 'null')

# Try to parse JSON w/ the above string; else, re-route err to standard output
begin
  parsed_json = JSON.parse(json_compatible_string)
rescue JSON::ParseError => e
  puts "JSON Parse Error #{e.message}"
  exit
end

# Clear console and pretty print formatted JSOn
puts `clear`
json_output = JSON.pretty_generate(parsed_json)
puts json_output
