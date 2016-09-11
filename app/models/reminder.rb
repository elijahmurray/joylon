class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ['active', 'late', 'completed']

  #after_initialize :set_defaults

  validates :frequency, presence: true

  def set_defaults
    self.status ||= :active
  end
end
