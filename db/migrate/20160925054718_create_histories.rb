class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :room_no

      t.timestamps null: false
    end
  end

end
