module Tenantable
  class Configuration
    def self.database(user_database)
      @database = user_database
    end

    def self.current_database
      @database
    end
  end
end
