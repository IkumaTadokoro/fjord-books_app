# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#follow / #unfollow' do
    alice = create(:alice)
    bob = create(:bob)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    alice = FactoryBot.create(:alice)
    assert 'Alice', alice.name_or_email
    alice.name = ''
    assert 'alice.example.com', alice.name_or_email
  end
end
