# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    alice = create(:alice)
    @report = create(:report, user_id: alice.id)
    basic_sign_in_as(alice)
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_link '新規作成'

    fill_in '内容', with: @report.content
    fill_in 'タイトル', with: @report.title
    click_button '登録する'

    assert_text '日報が作成されました'
    click_link '戻る'
    assert_text 'Railsでテスト'
    assert_text 'Alice'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集'
    fill_in '内容', with: 'オブジェクト指向はやっぱり難しい'
    fill_in 'タイトル', with: 'オブジェクト指向'
    click_button '更新する'
    assert_text '日報が更新されました'
    click_link '戻る'
    assert_text 'オブジェクト指向'
    assert_text 'Alice'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_link '削除'
    end
    assert_text '日報が削除されました'
    assert_no_text 'Railsでテスト'
    assert_no_text 'Alice'
  end
end
