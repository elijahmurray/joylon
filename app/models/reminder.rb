class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ['active', 'late', 'completed']

  before_create :set_due_date
  after_update :check_recurring

  validates :frequency, presence: true
  validates :due_date, presence: true

  def set_defaults
    self.status ||= :active
  end

  def set_due_date(create_from = Date.today())
    self.due_date = create_from + frequency_in_days.days
    #self.due_date = create_from
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
