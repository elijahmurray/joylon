class Relationship < ActiveRecord::Base
  RELATIONSHIP_TYPES = ["Family", "Professional Network", "Mentor", "Mentee"]

  has_many :reminders

  validates :name, presence: true
  validates :relationship_type, presence: true

  def sorted_reminders
    self.reminders.sort{|r| r.status <=> r.status}
  end

  def late_reminders
    self.reminders.select{|r| r.status == 'late'}
  end

  private
  def nightly_update
    #reminders.each do {|r| r.update_status}
    # late_reminders.each do {|r| send_notification(r) }
  end

end
