
module Tenantable
  def self.configure(&block)
    Configuration.class_eval(&block)
  end
end
