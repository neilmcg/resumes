class Permission < ActiveRecord::Base
  belongs_to :recruiter, :class_name => User.to_s, :foreign_key => :user_id
  belongs_to :owner, :class_name => User.to_s, :foreign_key => :owner_id
  
  validates_presence_of :recruiter
  validates_presence_of :owner
end
