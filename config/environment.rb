require_relative "application"
require 'base64'
require 'openssl'

# Fetch the base64-encoded key from the environment variable


# Check if the environment variable is set
require 'base64'
require 'openssl'

# Base64-encoded key
base64_key = "rrh7PtBApWPj57=="

# Decode the base64 string to get the original 16-byte key
@secret = Base64.decode64(base64_key)





# Initialize the cipher with the key
cipher = OpenSSL::Cipher.new('aes-128-cbc')
cipher.encrypt
cipher.key = @secret


puts "Key length: #{@secret.bytesize}"
puts "Key: #{@secret.inspect}"
# Initialize the Rails application.
Rails.application.initialize!
