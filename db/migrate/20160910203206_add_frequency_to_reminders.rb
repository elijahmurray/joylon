class AddFrequencyToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :frequency, :string
  end
end
