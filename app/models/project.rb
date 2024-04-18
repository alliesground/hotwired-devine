class Project < ApplicationRecord
  has_many :tasks

  def completion_ratio
    return 0.0 unless tasks.present?
    (tasks.completed.count / tasks.count.to_f) * 100
  end
end
