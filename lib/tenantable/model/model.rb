module Tenantable
  module Model
    extend ActiveSupport::Concern
     def create_schema(schema_name)
       Database::Adapter.vendor.create_schema schema_name
     end
  end
end
