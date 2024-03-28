require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  it "displays link to create new project" do
    render
    expect(rendered).to match /Create Project/
  end

  context "with existing projects" do
    before :each do
      assign(:projects, [
        create(:project, title: "project 1"),
        create(:project, title: "project 2"),
      ])
    end

    it "renders list of projects" do
      render
      expect(rendered).to match /project 1/
      expect(rendered).to match /project 2/
    end
  end
end
