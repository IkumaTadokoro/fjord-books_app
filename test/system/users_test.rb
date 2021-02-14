# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'sign_in via github' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = github_auth
    visit root_url
    assert_current_path('/users/sign_in')
    click_link 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'
    assert_current_path('/books')
  end
end
