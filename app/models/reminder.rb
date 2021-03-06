class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ['active', 'late', 'completed']

  before_validation :set_defaults
  after_update :create_next_reminder

  validates :frequency, presence: true
  validates :due_date, presence: true

  def set_defaults
    self.due_date ||= Date.today() + frequency_in_days.days
    self.status ||= 'active'
  end

  def update_status
    if due_date < Date.today() + 2.days && self.status != 'completed'
      self.update_attribute(:status, 'late') 
    end
  end

  def completed?
    self.status == 'completed'
  end

  private
  def create_next_reminder
    return unless self.completed?
    self.relationship.reminders.create(
      status: 'active', 
      frequency: self.frequency, 
      note: self.note,
      due_date: self.due_date = self.due_date + frequency_in_days.days
    )
  end

  def frequency_in_days
    return 0 if self.frequency.blank?
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
