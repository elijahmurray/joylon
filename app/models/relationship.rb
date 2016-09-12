class Relationship < ActiveRecord::Base
  RELATIONSHIP_TYPES = ["Family", "Professional Network", "Mentor", "Mentee"]

  belongs_to :user
  has_many :reminders

  validates :name, presence: true
  validates :relationship_type, presence: true

  def reminders_by_status(status = 'all')
    if status == 'all'
      results = self.reminders
    else
      results = self.reminders.select{|r| r.status == status}
    end
    #results.sort_by!(:created_at)
  end

  def update_reminder_statuses
    reminders.each {|r| r.update_status}
  end

  private
  def nightly_update
    # update_reminder_statuses
    # late_reminders.each do {|r| send_notification(r) }
  end

end
