# frozen_string_literal: true

class TasksTableComponent < ViewComponent::Base
  def initialize(tasks:)
    @tasks = tasks
  end

  def call
    component = Tables::TableComponent.new(rows: @tasks) do |table|
      table.set_column "" do |row|
        render CheckboxCompletionComponent.new(row)
      end
      table.set_column("Name", &:name)
      table.set_column "Actions" do |row|
        render Tables::TableComponent::ActionComponent.new(row)
      end
    end

    render component
  end

  class CheckboxCompletionComponent < ViewComponent::Base
    erb_template <<-ERB
      <%= form_with model: @task,
                    url: complete_task_path(@task),
                    method: :put,
                    data: { controller: "checkbox-completion-form" } do |form| %>
        <%= form.check_box :complete, data: {action: "checkbox-completion-form#submit" } %>
      <% end %>
    ERB

    def initialize(task)
      @task = task
    end
  end
end
