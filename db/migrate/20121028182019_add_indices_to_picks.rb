class AddIndicesToPicks < ActiveRecord::Migration
  def change
    add_index :picks, :pick_number
    add_index :picks, :user_id
  end
end
