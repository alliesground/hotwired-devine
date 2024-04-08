# frozen_string_literal: true

class Tables::TableComponent < ViewComponent::Base
  attr_reader :columns, :rows, :show_actions

  def initialize(rows: [], show_actions: false, &block)
    @rows = rows
    @columns = []
    @show_actions = show_actions
    yield self
  end

  def set_column(label, &block)
    @columns << {
      label: label,
      block: block
    }
  end

  class ActionComponent < ViewComponent::Base
    erb_template <<~ERB
      <td class="flex items-center px-6 py-4">
        <%= button_to "destroy", @row, method: :delete, class: "btn-primary-red" %>
      </td>
    ERB

    def initialize(show, row)
      @show = show
      @row = row
    end

    def render?
      @show
    end
  end
end
