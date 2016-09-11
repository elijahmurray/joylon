class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ['active', 'late', 'completed']

  #after_initialize :set_defaults
  after_update :check_recurring

  validates :frequency, presence: true

  def set_defaults
    self.status ||= :active
  end

  def due_date
    self.created_at + frequency_in_days.days
  end

  def update_status
    unless due_date > Date.today() + 1.days
      self.update_attribute(:status, 'late')
    else
      return
    end
  end

  def completed?
    self.status == 'completed'
  end


  private
  def check_recurring
    new_reminder = self.relationship.reminders.create(
      status: 'active', 
      frequency: self.frequency, 
      note: self.note)
    raise
  end

  def frequency_in_days
    day_mapping = { 
      "Daily" => 1,
      "Weekly" => 7,
      "Monthly" => 30,
      "Quarterly" => 90,
      "Yearly" => 365
    }
    day_mapping[self.frequency]
  end
end
