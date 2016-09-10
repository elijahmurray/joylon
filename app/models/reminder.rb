class Reminder < ActiveRecord::Base
  belongs_to :relationship

  FREQUENCIES = ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]

  def prettify
    output = date.strftime("%b %e, %l:%M %p")
    return output + ", " + note
  end
end
