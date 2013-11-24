require 'rubygems'
require 'twitter'

consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'

#function to post tweets
def twerkTweet(twerkToTweet)
    twerkClient = Twitter::REST::Client.new do |config|
        config.consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
        config.consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
        config.access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
        config.access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'
    end
    twerkClient.update(twerkToTweet)
end


client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = consumer_key
    config.consumer_secret     = consumer_secret
    config.access_token        = access_token
    config.access_token_secret = access_token_secret
end

#list of approved users and commands
arrayOfNames = ["tonyalbor","senor_white"]
arrayOfCommands = ["open","close","status"]
arrayofReponsesYes = ["@#{requester}, awesome I just #{command}ed the door!", ]
arrayofReponsesNo = ["@#{requester}, who are you?? Leave my property.", ]

# generic tweets to reply to users
tweetOpen = "the garage door is now open"
tweetClose = "the garage door is now closed"

#counters for responses
i = 0;
j = 0;

client.user do |message|
    if message.class == Twitter::Tweet
        # bool values to verify users and commands
        verifiedUser = 0
        verifiedCommand = 0
        
        requester = message["user"]["screen_name"]
        command = message.text[16,message.text.length - 16]
        
        if requester != "twerktowerdoor"
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
                twerkTweet(arrayofReponsesNo[i])
                i = i+1
            end
            
            # verifiedCommand will only be true if verifiedUser is true
            # plus if it actually is a verified command
            if verifiedCommand == 1
                puts "The Twerk Tower will now #{command} the garage door."
                twerkTweet(arrayofReponsesYes[j])
                j = j+1
                else
                puts "Nah fool"
            end
        end
    end
end