class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
end
