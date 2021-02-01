# frozen_string_literal: true

module UserDecorator
  def name_or_email
    name.presence || email
  end
end
