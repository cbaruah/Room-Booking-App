class CreateRoomHistories < ActiveRecord::Migration
  def change
    create_table :room_histories do |t|
      t.integer :room_no
      t.integer :user_id
      t.date :start_time
      t.datetime :end_time
      t.string :status

      t.timestamps null: false
    end
  end
end
