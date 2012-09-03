module Tenantable
  module Schema
    module Model
      extend ActiveSupport::Concern
        def schema_bounded
          Database::Adapter.vendor.create_schema(current_schema) unless Database::Adapter.vendor.schemas.include? current_schema
          ActiveRecord::Base.connection.schema_search_path = current_schema
          yield
         ensure
          ActiveRecord::Base.connection.schema_search_path = Database::Adapter.vendor.public_schema
        end

        def current_schema
          raise "Tenantable::Schema#current_schema must be override in the model"
        end

        def generate_schema_UUID
         alphabet = ('a'..'z').to_a
         first_letter = alphabet[ rand alphabet.size ]
         [first_letter, Time.new.to_time.to_i.to_s, SecureRandom.hex(10).to_s].flatten.join("")
       end
    
      module ClassMethods
        def schema(schema=nil)
          table_name =  self.table_name.split('.', 2).last
          self.table_name = "#{schema}.#{table_name}"
         end
      end

    end  
  end
end

