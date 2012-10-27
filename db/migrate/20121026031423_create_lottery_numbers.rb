class CreateLotteryNumbers < ActiveRecord::Migration
  def change
    create_table :lottery_numbers do |t|
      t.date :draw_date
      t.string :link
      t.date :next_draw
      t.string :winning_number

      t.timestamps
    end
  end
end
