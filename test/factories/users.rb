# frozen_string_literal: true

FactoryBot.define do
  factory :alice, class: User do
    name { 'Alice' }
    email { 'alice@example.com' }
    password { 'alice_password' }
  end

  factory :bob, class: User do
    provider { 'github' }
    name { 'Bob' }
    email { 'bob@example.com' }
    password { 'bob_password' }
  end
end
