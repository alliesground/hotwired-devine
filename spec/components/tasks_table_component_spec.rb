# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasksTableComponent, type: :component do
  let(:project) { create(:project) }
  let!(:tasks){
    build_list(:task, 2) do |task|
      task.project = project
      task.save!
    end
  }

  it "renders list of tasks" do
    render_inline(described_class.new(tasks: tasks))

    expect(page).to have_content "Name"
    expect(page).to have_content "Test task"
    expect(page).to have_content "Destroy"
  end
end