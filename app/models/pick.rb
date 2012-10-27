class Pick < ActiveRecord::Base
  attr_accessible :pick_number
  belongs_to :user
end
