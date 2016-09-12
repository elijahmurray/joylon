desc 'send emails to all users with a list of upcoming and late reminders'
task send_email_reminders: :environment do

  @users = User.all.to_a

  @users.each do |user|
    late_reminders = {}
    upcoming_reminders = {}
    user.relationships.each do |rel| 
      late_reminders[rel.name] = rel.reminders_by_status('late')
      upcoming_reminders[rel.name] =  rel.reminders_by_status('active')
    end

    email_address = user.email
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
