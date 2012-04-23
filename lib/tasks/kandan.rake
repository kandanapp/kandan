namespace :kandan do
  desc "Bootstrap an initial install of Kandan. Not strictly necessary, but faster."
  task :bootstrap => :environment do
    user = User.first

    if user.nil?
      puts "Creating default user..."
      user = User.new
      user.email      = "admin@kandan.me"
      user.first_name = "Admin"
      user.last_name  = "OfKandan"
      user.password   = "kandanadmin"
      user.password_confirmation = "kandanadmin"
      user.save!
    end

    channel = Channel.first

    if channel.nil?
      puts "Creating default channel..."
      channel = Channel.create :name => "Castle"

      ["Welcome to Kandan, the slickest chat app out there. Brought to you by the good people of CloudFuji (http://cloudfuji.com) and friends",
       "We think you'll really like Kandan, but if there's anything you would like to see, Kandan is fully open source, so you can dive into it or make suggestions on the mailing list.",
       "To get started, you can embed images or youtube clips, use the /me command (/me is in proper love with Kandan, innit!), upload files, or of course, just chat with your teammates.",
       "Just paste in an image url and type a subtitle http://kandan.me/images/kandan.png",
       "http://www.youtube.com/watch?v=Jgpty017CIw Same with youtube videos",
       "/me is in proper love with Kandan, innit!",
       "If you're the type of person who enjoys hacking on projects, the source to Kandan is at https://github.com/cloudfuji/kandan",
       "Well, that's about it. If you have any questions, concerns, or ideas, just shoot us an email support@cloudfuji.com! Have fun!",
       "Oh, sorry, one last thing - be sure to join the mailing list at https://groups.google.com/forum/?fromgroups#!forum/cloudfuji so you know there's a new release of Kandan!"
      ].each do |message|
        a = Activity.new
        a.content    = message
        a.channel_id = Channel.first
        a.user_id    = User.first
        a.action     = "message"
        a.save!
      end
    end
  end
end
