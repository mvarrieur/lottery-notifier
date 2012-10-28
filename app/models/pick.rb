class Pick < ActiveRecord::Base
  attr_accessible :pick_number, :user_id
  belongs_to :user

  def last_three_digits
    pick_number.gsub('-','')[-3,3]
  end
end
