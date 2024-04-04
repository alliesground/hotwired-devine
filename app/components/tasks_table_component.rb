# frozen_string_literal: true

class TasksTableComponent < ViewComponent::Base
  def initialize(tasks:)
    @tasks = tasks
  end

  def call
    component = Tables::TableComponent.new(rows: @tasks) do |table|
      table.set_column("Name", &:name)
    end

    render component
  end

end
