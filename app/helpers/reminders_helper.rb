module RemindersHelper
  def prettify(reminder)
    due_date = reminder.due_date.strftime("%b %e")

    label_class = {
      "active" => 'label-success',
      "late"=> 'label-warning',
      "completed" => 'label-default'
    }

    label = content_tag(:div, reminder.status, class: "label #{label_class[reminder.status]}")
    return label + " #{due_date} #{reminder.frequency} #{reminder.note}"
  end
end
