# frozen_string_literal: true

class ProgressBarComponent < ViewComponent::Base
  attr_reader :resource

  def initialize(resource)
    @resource = resource
  end
end
