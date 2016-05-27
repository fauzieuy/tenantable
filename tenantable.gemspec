Gem::Specification.new do |s|
  s.name            = "tenantable"
  s.version         = "0.0.1"
  s.date            = "2012-08-30"
  s.summary         = "Use Schema tenant approach on Rails 3 "
  s.description     = "There are 3 approachs to turn your application 'Tenantable'. One database per tenant, one database for all tenants and last but not least one database/schema per tenant "
  s.authors         = ["Thiago Dantas"]
  s.email           = "thiago.teixeira.dantas@gmail.com"
  s.files           = Dir['lib/**/*', "lib/tenantable/**"]
  s.homepage        = "http://rubygems.org/gems/tenantable"

  
  s.add_dependency 'activerecord', '~> 4.1.4'


end
