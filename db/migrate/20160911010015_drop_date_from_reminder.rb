class DropDateFromReminder < ActiveRecord::Migration
  def self.up
    remove_column :reminders, :date, :datetime
  end

  def self.down
    add_column :reminders, :date, :datetime
  end
end
