class AddDueDateToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :due_date, :date
  end
end
