# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |index| "test-#{index}@example.com" }
    sequence(:name) { |index| "user-#{index}" }
    password { 'password' }
  end
end
