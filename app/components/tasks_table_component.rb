# frozen_string_literal: true

class TasksTableComponent < ViewComponent::Base
  def initialize(tasks:)
    @tasks = tasks
  end

  def call
    component = Tables::TableComponent.new(rows: @tasks, show_actions: true) do |table|
      table.set_column("Name", &:name)
      table.set_column("Actions")
    end

    render component
  end

end
