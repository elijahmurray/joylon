module RelationshipsHelper
  def soonest_reminder(relationship)
    relationship.reminders.minimum(:due_date)
  end
end
