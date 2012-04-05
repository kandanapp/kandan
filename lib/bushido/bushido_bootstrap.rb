module Kandan
  module Bushido
    def self.enable_bushido!
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
        def bushido_extra_attributes(extra_attributes)
          self.first_name = "#{extra_attributes['first_name']}"
          self.last_name  = "#{extra_attributes['last_name']}"
          self.locale     = extra_attributes['locale']
          self.email      = extra_attributes['email']
        end
      end
    end

    def self.load_hooks!
      Dir["#{Dir.pwd}/lib/bushido/**/*.rb"].each { |file| load file }
    end

  end
end

if Bushido::Platform.on_bushido?
  class BushidoRailtie < Rails::Railtie
    config.to_prepare do
      puts "Enabling Bushido"
      Kandan::Bushido.enable_bushido!
      puts "Finished enabling Bushido"
    end
  end
end
