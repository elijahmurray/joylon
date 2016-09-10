class Relationship < ActiveRecord::Base
  REMINDER_FREQUENCIES = ["Once a Week", "Once a Month", "Once a Year"]
  RELATIONSHIP_TYPES = ["Family", "Professional Network", "Mentor", "Mentee"]
end
