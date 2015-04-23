class RoleServant < ActiveRecord::Base
  belongs_to :role
  belongs_to :servant
end
