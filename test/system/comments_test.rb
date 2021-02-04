# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  def setup
    @alice = create(:alice)
    basic_sign_in_as(@alice)
  end

  test 'comment on books' do
    visit book_path(create(:book))
    fill_in 'comment_content', with: 'おすすめの本です'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text 'おすすめの本です'
    assert_text 'Alice'
  end

  test 'comment on report' do
    visit report_path(create(:report, user_id: @alice.id))
    fill_in 'comment_content', with: '今日も1日お疲れ様でした！'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text '今日も1日お疲れ様でした'
    assert_text 'Alice'
  end
end
