namespace :bushido do
  desc "Run the initial setup for a Busido app. Copies config files and seeds db."
  task :install => :environment do
    user = User.first

    if user.nil?
      puts "Creating default user..."
      user = User.new
      user.email = "#{::Bushido::Platform.name}@#{ENV['BUSHIDO_HOST']}"
      user.first_name = ::Bushido::Platform.name[0..1].upcase
      user.last_name  = ::Bushido::Platform.name
      user.ido_id = "temporary_user"
      user.save!
    end

    channel = Channel.first

    if channel.nil?
      puts "Creating default channel..."
      channel = Channel.create :name => "Lobby"
    end
  end
end