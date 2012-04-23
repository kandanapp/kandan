namespace :cloudfuji do
  desc "Run the initial setup for a Busido app. Copies config files and seeds db."
  task :install => :environment do
    user = User.first

    if user.nil?
      puts "Creating default user..."
      user = User.new
      user.email = "#{::Cloudfuji::Platform.name}@#{ENV['CLOUDFUJI_HOST']}"
      user.first_name = ::Cloudfuji::Platform.name[0..1].upcase
      user.last_name  = ::Cloudfuji::Platform.name
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
