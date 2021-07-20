class Owner < ActiveRecord::Base
    has_many :vehicles
    has_many :routines, through: :vehicles
    
    
end