# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = create(:book)
    basic_sign_in_as(create(:alice))
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_link '新規作成'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    fill_in '著者', with: @book.author
    click_button '登録する'

    assert_text '本が作成されました'
    click_link '戻る'
    assert_text '独学大全'
    assert_text '独学はいつでもやめることができるのだ'
    assert_text '読書猿'
  end

  test 'updating a Book' do
    visit books_url
    click_link '編集'

    fill_in 'メモ', with: '現代でも役立つ知識がここにある'
    fill_in 'タイトル', with: '孫氏の兵法'
    fill_in '著者', with: '孫氏'
    click_button '更新する'

    assert_text '本が更新されました'
    click_link '戻る'
    assert_text '孫氏の兵法'
    assert_text '現代でも役立つ知識がここにある'
    assert_text '孫氏'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_link '削除'
    end

    assert_text '本が削除されました'
    assert_no_text '独学大全'
    assert_no_text '独学はいつでもやめることができるのだ'
    assert_no_text '読書猿'
  end
end
