require 'json'
def merge_json_files(file1_path, file2_path)

  file_1 = File.read(file1_path)
  file_2 = File.read(file2_path)

  content1 = JSON.parse(file_1)
  content2 = JSON.parse(file_2)

  merged_content = content1 + content2

  File.write(file2_path, JSON.pretty_generate(merged_content))
  puts "Merged JSON written to #{file2_path}"
end
