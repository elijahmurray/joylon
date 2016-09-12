class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # include ActionView::Helpers::TagHelper
  
  has_many :relationships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def reminders_email
    late_reminders = {}
    upcoming_reminders = {}
    self.relationships.each do |rel| 
      late_reminders[rel.name] = rel.reminders_by_status('late')
      upcoming_reminders[rel.name] =  rel.reminders_by_status('active')
    end

    email_address = self.email
    Mail.deliver do
      to email_address
      from 'elijahmurray@gmail.com'
      subject 'Your Daily Joylon Reminders'
      html_part do
        body ApplicationController.new.render_to_string('emails/_daily_reminders', locals: {upcoming_reminders: upcoming_reminders, late_reminders: late_reminders}, :layout => false)
      end
    end
  end

end
