namespace :kandan do
  desc "Bootstrap an initial install of Kandan. Not strictly necessary, but faster."
  task :bootstrap => :environment do

    # Initialize default settings
    Setting.my_settings

    user = User.first

    if user.nil?
      puts "Creating default user..."
      user = User.new
      user.email      = "admin@kandanapp.com"
      user.username  = "admin"
      user.first_name = "Admin"
      user.last_name  = "OfKandan"
      user.password   = "kandanappadmin"
      user.password_confirmation = "kandanappadmin"
      user.is_admin = true
      user.save!
    end

    channel = Channel.first

    if channel.nil?
      puts "Creating default channel..."
      channel = Channel.create :name => "Lobby"

      ["Welcome to Kandan, the slickest chat app out there. Brought to you by the good people of KandanApp (http://kandanapp.com) and friends",
       "We think you'll really like Kandan, but if there's anything you would like to see, Kandan is fully open source, so you can dive into it or make suggestions.",
       "To get started, you can embed images or youtube clips, use the /me command (/me is in proper love with Kandan, innit!), upload files, or of course, just chat with your teammates.",
       "Just paste in an image url and type a subtitle http://kandanapp.com/images/kandanlogo.png",
       "http://www.youtube.com/watch?v=MvzyWk4lMc8 Same with youtube videos",
       "To mention other folks just use @ and their username or use @all",
       "Checkout all emoticons available at http://www.emoji-cheat-sheet.com/",
       ":+1:",
       "/me is in proper love with Kandan, innit!",
       "If you're the type of person who enjoys hacking on projects, the source to Kandan is at https://github.com/kandanapp/kandan",
       "Well, that's about it. If you have any questions, concerns, or ideas, just shoot us an email admin@kandanapp.com! Have fun!",
      ].each do |message|
        a = Activity.new
        a.content    = message
        a.channel    = Channel.first
        a.user       = User.first
        a.action     = "message"
        a.save!
      end
    end
  end

  desc "Creates the default hubot account."
  task :boot_hubot => :environment do
    user = User.find_by_email("hubot@cloudfuji.com")

    if user.nil?
      puts "Creating hubot user..."

      password = ""
      128.times { password << (('a'..'z').to_a + ('A'..'Z').to_a + ['!','@','#','$','%','^','&','*','(',')'].to_a).sample }

      hubot = User.new
      hubot.email      = "hubot@cloudfuji.com"
      hubot.first_name = "Hubot"
      hubot.last_name  = "vonGithubben"
      hubot.ido_id     = "a-bot-lives-in-solitude"
      hubot.password   = password            if hubot.respond_to?("password=".to_sym)
      hubot.password_confirmation = password if hubot.respond_to?("password_confirmation=".to_sym)
      hubot.save!
    end
  end

  desc "Output the hubot access key"
  task :hubot_access_key => :environment do
    if authentication_token = User.find_by_email("hubot@cloudfuji.com").try(:authentication_token)
      puts "Your hubot access key is #{ authentication_token }"
    else
      puts "There's not hubot account. Run rake kandan:boot_hubot to create a bot account."
    end
  end
end
