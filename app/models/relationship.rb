class Relationship < ActiveRecord::Base
  RELATIONSHIP_TYPES = ["Family", "Professional Network", "Mentor", "Mentee"]

  has_many :reminders

  validates :name, presence: true
  validates :relationship_type, presence: true

  def sorted_reminders
    self.reminders.sort{|r| r.status <=> r.status}
  end
end
