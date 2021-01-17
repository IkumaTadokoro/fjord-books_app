# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :contents, presence: true
end
