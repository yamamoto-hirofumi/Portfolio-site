module SignInSupport
  def sign_in(user)
    visit root_path
    click_link "ログイン"
    fill_in "name", with: user.name
    fill_in "password", with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq posts_path
  end
end
