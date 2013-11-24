require 'rubygems'
require 'tweetstream'
require 'json'
require 'oauth'

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
        end
        else
        puts "#{requester}, who are you?? Leave my property."
    end
    
    # verifiedCommand will only be true if verifiedUser is true
    # plus if it actually is a verified command
    if verifiedCommand == 1
        puts "The Twerk Tower will now #{command} the garage door."
        else
        puts "Nah fool"
    end
end
