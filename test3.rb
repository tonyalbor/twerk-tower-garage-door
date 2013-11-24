require 'rubygems'
require 'tweetstream'
#require 'json'
require 'oauth'
<<<<<<< HEAD
=begin
def twerkTweet(twerkStatus)
    client_twitter = Twitter::Client.new do |config|
        config.consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
        config.consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
        config.access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
        config.access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'
    end
    
client_twitter.update("new tweet")
end
=end
=======
load 'tweet.rb'

>>>>>>> 9b97875d4300ba8e535d0c22f4555e2f14138026
TweetStream.configure do |config|
    config.consumer_key       = 'TF2MfJkWtjkJ5a0fBzTF0Q'
    config.consumer_secret    = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
    config.oauth_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
    config.oauth_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'
    config.auth_method        = :oauth
end


arrayOfNames = ["tonyalbor","senor_white"]
arrayOfCommands = ["open","close","status"]

# generic tweets to reply to users
tweetOpen = "the garage door is now open"
tweetClose = "the garage door is now closed"

client = TweetStream::Client.new
idk = 0
client.userstream do |mention|
    # bool values to verify users and commands
    verifiedUser = 0
    verifiedCommand = 0
    
    requester = mention["user"]["screen_name"]
    command = mention.text[16,mention.text.length - 16]
    
    # traverse array of names to determine if user is verified
    arrayOfNames.each do |approvedName|
        if requester == approvedName
            verifiedUser = 1
        end
    end
    
    if verifiedUser == 1
        # traverse array of commands to determine if command is verified
        arrayOfCommands.each do |approvedCommand|
            if command == approvedCommand
                verifiedCommand = 1
            end
            else
            puts "#{requester}, who are you?? Leave my property."
    end
    
    end
    
    # verifiedCommand will only be true if verifiedUser is true
    # plus if it actually is a verified command
    if verifiedCommand == 1
        puts "The Twerk Tower will now #{command} the garage door."
<<<<<<< HEAD
        idk = 1
        client.update("Dlkdjf;aldjf;lkjf;a")
        client.stop
        
        else
=======
        twerkTweet("@#{requester}, awesome I just #{command}ed the door!")
    else
>>>>>>> 9b97875d4300ba8e535d0c22f4555e2f14138026
        puts "Nah fool"
    end
end

require 'twitter'

if idk == 1
    puts "lasdjf;alsdjfl;asdkf"
    
    client_twitter = Twitter::Client.new do |config|
        config.consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
        config.consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
        config.access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
        config.access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'
    end
    
    client_twitter.update("new tweet")

    
    
    #client_twitter.update("new tweeet")
    #twerkTweet("hello there")
    end
