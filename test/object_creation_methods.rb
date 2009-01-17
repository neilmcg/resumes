require 'fixjour'
require 'faker'

Fixjour do
  define_builder(User) do |klass, overrides|
    klass.new(:login => Faker::Internet.user_name, :email => Faker::Internet.email, :password => 'quire69', :password_confirmation => 'quire69')
  end
end