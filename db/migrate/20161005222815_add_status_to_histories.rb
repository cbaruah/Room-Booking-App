class AddStatusToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :status, :integer, default: 1
	add_column :histories, :slot, :integer
	end
end
