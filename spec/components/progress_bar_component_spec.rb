# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProgressBarComponent, type: :component do
  let!(:project) { create(:project) }
  let!(:task1) { create(:task, project: project, complete: true) }
  let!(:task2) { create(:task, project: project, complete: true) }

  it "renders progress in percent" do
    render_inline(described_class.new(project))

    expect(page).to have_content "100%"
  end
end
