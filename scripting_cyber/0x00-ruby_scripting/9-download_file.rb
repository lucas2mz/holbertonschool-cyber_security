require 'open-uri'
require 'uri'
require 'fileutils'

def download_file
  if ARGV.length != 2
    puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
    return
  end

  url = ARGV[0]
  local_path = ARGV[1]

  puts "Downloading file from #{url}…"

  URI.open(url) do |remote_file|
    FileUtils.cp(remote_file, local_path)
  end

  puts "File downloaded and saved to #{local_path}."
end

download_file