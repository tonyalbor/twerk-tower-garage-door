require 'rubygems'
require 'twitter'

consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'

#function to post tweets
def twerkTweet(name,tweetMessage)
    twerkClient = Twitter::REST::Client.new do |config|
        config.consumer_key        = 'TF2MfJkWtjkJ5a0fBzTF0Q'
        config.consumer_secret     = 'zh5zvSrd9DHFyd7VQecnTu3iTuUwbheYj9hilsKgUeQ'
        config.access_token        = '2211707144-coqGW3MUb91RfVXBygz3GEcJD0vhWNZUDeZh4Uy'
        config.access_token_secret = 'Kw9Psz7EtyyvRS5gFsp7WYxrh787bM3qK4ZPVrHiCNCyI'
    end
    twerkClient.update("@#{name}, #{tweetMessage}")
    puts "Just tweeted: @#{name}, #{tweetMessage}"
end


client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = consumer_key
    config.consumer_secret     = consumer_secret
    config.access_token        = access_token
    config.access_token_secret = access_token_secret
end

command = ""

#list of approved users and commands
arrayOfNames = ["tonyalbor","senor_white"]
arrayOfCommands = ["open","close"]
arrayofReponsesYes =
                    ["awesome I'll #{command} the door!",
                     "cool, gimme a second.",
                     "WAIT ON THE LAWN",
                     "{command}ing the door",
                     "#{command} #{command} #{command}",
                     "I LOVE TWITTER! #{command}ing now",
                     "I AM A DOOR....about to #{command}",
                     "TWERK TOWER DOOR #{command}",
                     "'YOU SHALL #{command}' - gandalf",
                     "I'm gettin too old for #{command}ing this shit"
]
arrayofReponsesNo =
                    ["who are you?? Leave my property.",
                     "I don't let strangers in my house.",
                     "the police is on its way",
                     "GET OFF MY LAWN",
                     "just no",
                     "the neighbor is watching you..",
                     "permission denied",
                     "do I know you?",
                     "stop trying to get in!",
                     "I'm getting the hose ready."]
arrayOfResponsesFail =
                    ["I didn't understand you",
                     "whaaaat?",
                     "come again?",
                     "excuse me?",
                     "not sure what you mean by that.",
                     "I'm afraid I can't do that.",
                     "no thank you.",
                     "idk how to do that.",
                     "'I'm okay, thank you!' - the tyrant",
                     "maybe later"
]

# generic tweets to reply to users
tweetOpen = "the garage door is now open"
tweetClose = "the garage door is now closed"

#counters for responses
i = 0;
j = 0;
k = 0;

def incrementCounter(count)
    if count == 9
       count = 0
    else
        count = count + 1
    end
    return count
end

client.user do |message|
    if message.class == Twitter::Tweet
        # bool values to verify users and commands
        verifiedUser = 0
        verifiedCommand = 0
        
        alreadyTweeted = 0
        
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
                twerkTweet(requester,arrayofReponsesNo[i])
                alreadyTweeted = 1
                i = incrementCounter(i)
            end
            
            # verifiedCommand will only be true if verifiedUser is true
            # plus if it actually is a verified command
            if verifiedCommand == 1
                
                if command == "open"
                    result = exec("python on.py")
                elsif command == "closed"
                    result = exec("python off.py")
                end
                
                twerkTweet(requester,arrayofReponsesYes[j])
                j = incrementCounter(j)
                else
                if alreadyTweeted == 0
                    twerkTweet(requester,arrayOfResponsesFail[k])
                end
                k = incrementCounter(k)
            end
        end
    end
end