class Routine < ActiveRecord::Base
    belongs_to :vehicle
    belongs_to :owner, through: :vehicle
end