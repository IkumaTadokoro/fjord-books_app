# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "name#{i}" }
    sequence(:email) { |i| "sample#{i}@example.com" }
    sequence(:password) { |i| "password#{i}" }
  end
end
