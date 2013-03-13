class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

if Rails.env.javascript_test?
  module ActiveRecord
    module ConnectionAdapters
      module QueryCache
        private
          def cache_sql(sql,binds)
            yield
          end
      end
    end
  end
end
