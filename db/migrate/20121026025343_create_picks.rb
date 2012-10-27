class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :pick_number

      t.timestamps
    end
  end
end
