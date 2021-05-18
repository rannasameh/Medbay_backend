class Reminder < ApplicationRecord
  belongs_to :patient
  belongs_to :medication
end
