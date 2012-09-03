module Tenantable
  module Schema
    module Controller
      extend ActiveSupport::Concern
      
       module InstanceMethods
         def schema_search_path(name, include_public = true)
          public_schema = Database::Adapter.vendor.public_schema
          ActiveRecord::Base.connection.schema_search_path = [name.to_s, (public_schema if include_public)].compact.join(",")
         end

        def default_search_path
         ActiveRecord::Base.connection.schema_search_path = Database::Adapter.vendor.default_schema
        end 
        end
    end   
  end
end


