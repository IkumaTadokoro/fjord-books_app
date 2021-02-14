# frozen_string_literal: true

module SignInHelper
  def basic_sign_in_as(user)
    visit root_url
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    @current_user = user
  end

  def github_auth
    OmniAuth::AuthHash.new({
                             provider: 'github',
                             uid: '12345',
                             info: {
                               name: 'github_user',
                               email: 'github_user@example.com'
                             }
                           })
  end
end
