require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  let(:project) { create(:project) }
  let!(:tasks) {
    build_list(:task, 2) do |task|
      task.project = project
      task.save!
    end
  }

  before :each do
    assign(:project, project)
  end

  it "displays link to create new task" do
    render
    expect(rendered).to match /Create Task/
  end

  it "displays title of the current project" do
    render
    expect(rendered).to match /#{project.title}/
  end

  it "displays list of project tasks" do
    render
    expect(rendered).to match /#{tasks.first.name}/
    expect(rendered).to match /#{tasks.last.name}/
  end
end
