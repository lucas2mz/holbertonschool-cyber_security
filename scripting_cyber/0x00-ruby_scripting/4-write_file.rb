require 'json'
def merge_json_files(file1_path, file2_path)

    file1 = File.read(file1_path)
    file2 = File.read(file2_path)

    content1 = JSON.parse(content1)
    content2 = JSON.parse(content2)

    merged_content = data2 + data1

    File.write(file2_path, JSON.pretty_generate(merged_content))
    puts "Merged JSON written to #{file2_path}"
end