require 'rubygems'
require 'twitter'
require 'oauth'

client_twitter = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = "TF2MfJkWtjkJ5a0fBzTF0Q"
    config.consumer_secret     = "zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ"
    config.access_token        = "2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy"
    config.access_token_secret = "Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI"
end

tweetClass = "Twitter::Tweet"

client_twitter.user do |message|
    if message.class == Twitter::Tweet
    
    
    
    else
    
    end
    
end
