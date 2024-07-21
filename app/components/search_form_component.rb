# frozen_string_literal: true

class SearchFormComponent < ViewComponent::Base
  attr_reader :url

  def initialize(url:)
    @url = url
  end

end
