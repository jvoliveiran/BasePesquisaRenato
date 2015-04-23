class DisciplineServant < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :servant
end
