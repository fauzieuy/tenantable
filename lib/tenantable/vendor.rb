module Tenantable
  module Vendor
    class Postgres <  Database::Adapter

      def self.database
        :postgres
      end

      def self.schemas
        sql = "SELECT nspname FROM pg_namespace WHERE nspname !~ '^pg_.*'"
        ActiveRecord::Base.connection.query(sql).flatten
      end

      def self.create_schema(schema_name)
        sql = %{CREATE SCHEMA "#{schema_name}" }
        ActiveRecord::Base.connection.execute sql
      end

      def self.public_schema
        "public"
      end

      def self.default_schema
         %{"$user", public}
      end

    end
  end
end
