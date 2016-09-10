class RemoveReminderFrequencyFromRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :reminder_frequency, :string
  end
end
