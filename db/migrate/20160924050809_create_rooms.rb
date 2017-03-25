class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.string :building
      t.integer :size
      t.string :status

      t.timestamps null: false
    end
  end
end
