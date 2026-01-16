require 'json'

def count_user_ids(path)
  file = File.read(path)
  json = JSON.parse(file)

  ids = Hash.new(0)

  json.each do |item|
  user_id = item["userId"]
  ids[user_id] += 1
  end

  ids.each do |key, value|
  puts "#{key}: #{value}"
  end

end