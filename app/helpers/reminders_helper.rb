module RemindersHelper
  def prettify(reminder)
    date = reminder.date.strftime("%b %e, %l:%M %p")

    label_class = {
      "active" => 'label-success',
      "late"=> 'label-warning',
      "completed" => 'label-default'
    }

    label = content_tag(:div, reminder.status, class: "label #{label_class[reminder.status]}")
    return label + " #{date}  #{reminder.note}"
  end
end
