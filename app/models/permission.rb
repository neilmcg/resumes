class Permission < ActiveRecord::Base
  belongs_to :user, :foreign_key => "owner_id"
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
end
