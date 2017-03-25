class AddColumnDateToHistories < ActiveRecord::Migration
  def change
	add_column :histories, :date, :timestamp
  end
end
