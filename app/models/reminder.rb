class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]

  validates :frequency, presence: true

  def prettify
    output = date.strftime("%b %e, %l:%M %p")
    return output + ", " + note
  end
end
