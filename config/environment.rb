require_relative "application"
require 'base64'
require 'openssl'

# Fetch the base64-encoded key from the environment variable


# Check if the environment variable is set
if base64_key.nil? || base64_key.empty?
  raise "Environment variable SECRET_KEY_BASE64 is not set or empty"
end

# Decode the base64 string to get the original 16-byte key
@secret = Base64.decode64(base64_key)

# Ensure the key is exactly 16 bytes
unless @secret.bytesize == 16
  raise "Decoded key is not 16 bytes! Actual size: #{@secret.bytesize}"
end

# Initialize the cipher with the key
cipher = OpenSSL::Cipher.new('aes-128-cbc')
cipher.encrypt
cipher.key = @secret

# Debugging output to verify the key
puts "Decoded key length: #{@secret.bytesize}"
puts "Decoded key: #{@secret.inspect}"
puts "HEYYYYY MACARENA"

# Initialize the Rails application.
Rails.application.initialize!
