class CreateRoomReserves < ActiveRecord::Migration
  def change
    create_table :room_reserves do |t|
      t.integer :room_no
      t.integer :user_id
      t.timestamp :end_time

      t.timestamps null: false
    end
  end
end
