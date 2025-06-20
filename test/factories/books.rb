# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { '独学大全' }
    memo { '独学はいつでもやめることができるのだ' }
    author { '読書猿' }
  end
end
