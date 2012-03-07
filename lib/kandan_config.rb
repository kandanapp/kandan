module Kandan
  class Config

    class << self
      def options
        @config ||= YAML.load_file "#{Rails.root}/config/kandan_settings.yml"
      end
      
      def broadcaster
        Broadcasters.const_get(Kandan::Config.options[:broadcaster][:name])
      end
    end

  end
end
