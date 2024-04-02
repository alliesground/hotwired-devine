# frozen_string_literal: true

class Tables::TableComponent < ViewComponent::Base
  attr_reader :columns, :rows

  def initialize(rows: [], &block)
    @rows = rows
    @columns = []
    yield self
  end

  def set_column(label, &block)
    @columns << {
      label: label,
      block: block
    }
  end
end
