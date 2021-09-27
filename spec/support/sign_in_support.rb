module SignInSupport
  def sign_in(user)
    visit root_path
    click_link "ログイン"
    fill_in "session_name", with: user.name
    fill_in "session_password", with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq posts_path
  end
end
