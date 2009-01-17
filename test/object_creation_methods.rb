require 'fixjour'

Fixjour do
  define_builder(User) do |klass, overrides|
    klass.new(:login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69')
  end
end