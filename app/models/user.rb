require 'digest/sha1'

class User < ActiveRecord::Base
  include AuthenticatedModel # moved this logic to lib/authenticated_model.rb
  
  has_many :permissions, :foreign_key => :owner_id
  
  def can_view_profile?(user_with_profile)
    false
  end
end
