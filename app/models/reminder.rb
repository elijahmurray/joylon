class Reminder < ActiveRecord::Base
  belongs_to :relationship

  def prettify
    output = date.strftime("%b %e, %l:%M %p")

    return output + ", " + note
  end
end