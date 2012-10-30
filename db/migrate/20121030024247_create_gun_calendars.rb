class CreateGunCalendars < ActiveRecord::Migration
  def change
    create_table :gun_calendars do |t|
      t.date :date
      t.text :gun_description
      t.decimal :value

      t.timestamps
    end
    add_index :gun_calendars, :date
  end
end
