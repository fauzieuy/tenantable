module Tenantable
  module Database
    class Adapter
      @adapters = []
      def self.inherited(base)
        @adapters << base 
      end

      def self.vendor
        @adapters.each do |vendor|  
          return vendor  if vendor.database == Configuration.current_database
        end
      end
    end

  end
end
