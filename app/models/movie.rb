class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  scope :by_title, -> (value) { where("title ILIKE ?", "%#{value}%") }
end
