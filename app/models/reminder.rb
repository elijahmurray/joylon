class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
  STATUSES = ["Active", "Missed", "Completed"]

  after_initialize :set_defaults

  attr_accessor :status

  validates :frequency, presence: true

  def set_defaults
    self.status ||= "Active"
  end

  def prettify
    output = date.strftime("%b %e, %l:%M %p")
    return output + ", " + note
  end
end
