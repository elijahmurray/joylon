class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ['active', 'late', 'completed']

  before_validation :set_defaults
  after_update :follow_up_reminder

  validates :frequency, presence: true
  validates :due_date, presence: true

  def set_defaults
    self.due_date ||= Date.today() + frequency_in_days.days
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
  def follow_up_reminder
    return unless self.completed?
    self.relationship.reminders.create(
      status: 'active', 
      frequency: self.frequency, 
      note: self.note,
      due_date: self.due_date = self.due_date + frequency_in_days.days
    )
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
