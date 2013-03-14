module Kandan
  class Config
    class << self
      def options
        @config ||= YAML.load_file "#{Rails.root}/config/kandan_settings.yml"
      end
      
      def broadcaster
        Broadcasters.const_get(Kandan::Config.options[:broadcaster][:name])
      end

      def to_json
        @json_representation ||= options.dup.tap do |h|
          h[:broadcaster][:config] = {
            endpoint: "#{ENV['KANDAN_FAYE_URL']}/remote/faye"
          }
        end.to_json
      end
    end

  end
end
