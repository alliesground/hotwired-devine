# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectsTableComponent, type: :component do
  # let(:projects) { create_list(:project, 2) }
  
  it "renders list of projects" do
    projects = create_list(:project, 2) do |project, i|
      project.title = "Title#{i}"
    end

    render_inline(described_class.new(projects: projects))

    expect(page).to have_text "Title0"
    expect(page).to have_text "Title1"
  end
end
