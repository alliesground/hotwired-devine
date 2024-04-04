FactoryBot.define do
  factory :task do
    project
    name { "Test task" }
  end
end
