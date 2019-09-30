class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings
end