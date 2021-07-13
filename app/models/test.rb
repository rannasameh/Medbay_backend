class Test < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one_attached :testFile
end
