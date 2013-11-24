require 'rubygems'
require 'json'
require 'oauth'
require 'pp'

consumer_key = OAuth::Consumer.new(
        "TF2MfJkWtjkJ5a0fBzTF0Q",
        "zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ")

access_token = OAuth::Token.new(
        "2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy",
        "Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI")

baseurl = "https://api.twitter.com"

print "account or mentions (a/m) ?"
addressChoice = gets.chomp
if addressChoice == "a"
    address = URI("#{baseurl}/1.1/account/verify_credentials.json")
    else
    address = URI("#{baseurl}/1.1/statuses/mentions_timeline.json?count=1")
end

#account/verify_credentials.json

#print "Enter Twitter handle to look-up: "
#user_name = gets.chomp
#account/verify_credentials.json
#address = URI("#{baseurl}/1.1/users/lookup.json?screen_name=#{user_name}")

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Issue the request.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token
http.start

response = http.request(request)
if response.code == '200'
    parsed_response = JSON.parse(response.body)
    puts response.body
    else
    puts "Expected a response of 200 but got #{response.code} instead"
    puts response
end

nil