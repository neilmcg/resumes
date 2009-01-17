require 'fixjour'
require 'faker'

Fixjour do
  define_builder(User) do |klass, overrides|
    klass.new(:login => Faker::Internet.user_name, :email => Faker::Internet.email, :password => 'quire69', :password_confirmation => 'quire69')
  end
  
  define_builder(Permission) do |klass, overrides|
    klass.new :recruiter => new_user, :owner => new_user
  end
end