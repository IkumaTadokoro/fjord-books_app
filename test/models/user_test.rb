# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#follow / #unfollow' do
    alice = create(:user)
    bob = create(:user)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    alice = create(:user, email: 'alice@example.com', name: 'Alice')
    assert_equal 'Alice', alice.name_or_email
    alice.name = ''
    assert_equal 'alice@example.com', alice.name_or_email
  end
end
