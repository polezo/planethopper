class Landing < ActiveRecord::Base
    belongs_to :planet
    belongs_to :player

end