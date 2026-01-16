require 'digest'

def crack_password
  if ARGV.length != 2
    puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
    return
  end

  hashed_pass = ARGV[0]
  dictionary = ARGV[1]

  File.foreach(dictionary) do |line|
    word = line.strip
    hashed_word = Digest::SHA256.hexdigest(word)

    if hashed_word == hashed_pass
      puts "Password found: #{word}"
      return
    end
  end

  puts "Password not found in dictionary."
end

crack_password