# frozen_string_literal: true

class ProjectsTableComponent < ViewComponent::Base
  def initialize(projects:)
    @projects = projects
  end

  def call
    component = Tables::TableComponent.new(rows: @projects) do |table|
      table.set_column("Title", &:title)
      table.set_column "Completion" do |row|
        render ProgressBarComponent.new(row)
      end
    end

    render component
  end
end
