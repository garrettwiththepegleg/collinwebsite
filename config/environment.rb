require_relative "application"
require 'base64'
require 'openssl'

# Fetch the base64-encoded key from the environment variable


# Check if the environment variable is set
@secret = "rrh7PtBApWPj57=="





# Initialize the cipher with the key
cipher = OpenSSL::Cipher.new('aes-128-cbc')
cipher.encrypt
cipher.key = @secret



# Initialize the Rails application.
Rails.application.initialize!
