class Task < ApplicationRecord
  belongs_to :project
  broadcasts_refreshes_to -> (task) { :tasks }

  scope :completed, -> { where(complete: true) }
end
