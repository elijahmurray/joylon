class Relationship < ActiveRecord::Base
  RELATIONSHIP_TYPES = ["Family", "Professional Network", "Mentor", "Mentee"]

  has_many :reminders

  validates :name, presence: true
  validates :relationship_type, presence: true

  def sorted_reminders
    self.reminders.sort{|r| r.status <=> r.status}
  end

  def reminder_notifications
    self.reminders.select{|r| r.status == 'late'}
  end

  def update_all_reminder_statuses
    #if reminder.due_date < Date.today() - 1
    #  send notification
    #  else
    #  return
    #  end
  end
end
