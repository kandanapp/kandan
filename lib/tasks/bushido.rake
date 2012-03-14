namespace :bushido do
  task :install => :environment do
    channel = Channel.new :name => "Lobby"
    if channel.save
      puts "Created the default channel"
    else
      puts "Error creating the default channel"
    end
  end
end
