class Task < ApplicationRecord
  belongs_to :project

  scope :completed, -> { where(complete: true) }
end
