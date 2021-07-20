class Vehicle < ActiveRecord::Base
    belongs_to :owner
    has_many :routines
    
end