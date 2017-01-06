module RelationshipsHelper
  def next_reminder_due_in(relationship)
    due_date = relationship.reminders.minimum(:due_date) || nil
    distance_of_time_in_words(Time.now(), due_date) if due_date
  end
end
