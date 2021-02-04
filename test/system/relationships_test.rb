# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  def setup
    @alice = create(:alice)
    @bob = create(:bob)
    basic_sign_in_as(@alice)
  end

  test 'follow_user' do
    visit user_path(@bob)
    assert_difference('@alice.followings.count', 1) do
      click_button 'フォローする'
      assert_text 'フォローしました。'
    end
  end

  test 'unfollow_user' do
    @alice.follow(@bob)
    visit user_path(@bob)
    assert_difference('@alice.followings.count', -1) do
      click_button 'フォロー解除する'
      assert_text 'フォロー解除しました。'
    end
  end
end
