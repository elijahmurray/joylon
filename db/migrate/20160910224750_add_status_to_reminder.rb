class AddStatusToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :status, :string
  end
end
