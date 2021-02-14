# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    user
    title { 'Railsでテスト' }
    content { '今日はRailsでテストを書きました' }
  end
end
