module Kandan
  module Cloudfuji
    def self.enable_cloudfuji!
      self.load_hooks!
      self.extend_user!
    end

    def self.extend_user!
      puts "Extending the User model"
      User.instance_eval do
        validates_presence_of   :ido_id
        validates_uniqueness_of :ido_id

        attr_accessible :ido_id
      end

      User.class_eval do
        def cloudfuji_extra_attributes(extra_attributes)
          self.first_name = "#{extra_attributes['first_name']}"
          self.last_name  = "#{extra_attributes['last_name']}"
          self.locale     = extra_attributes['locale']
          self.email      = extra_attributes['email']
        end
      end
    end

    def self.load_hooks!
      Dir["#{Dir.pwd}/lib/cloudfuji/**/*.rb"].each { |file| load file }
    end

  end
end

if Cloudfuji::Platform.on_cloudfuji?
  class CloudfujiRailtie < Rails::Railtie
    config.to_prepare do
      puts "Enabling Cloudfuji"
      Kandan::Cloudfuji.enable_cloudfuji!
      puts "Finished enabling Cloudfuji"
    end
  end
end
