# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectsTableComponent, type: :component do
  let(:projects) { create_list(:project, 2) }
  
  it "renders list of projects" do
    render_inline(described_class.new(projects: projects))

    within '.table-auto' do
      expect(page).to have_content "Titles"
    end
  end

  # it "renders something useful" do
  #   expect(render_inline(described_class.new(projects: projects)).to include(
  #     "Hello, components!"
  #   ))
  # end
end
