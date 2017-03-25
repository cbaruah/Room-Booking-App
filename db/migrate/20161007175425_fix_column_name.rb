class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :histories, :room_no, :room_id
  end
end
