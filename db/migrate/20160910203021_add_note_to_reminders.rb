class AddNoteToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :note, :text
  end
end
