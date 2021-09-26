module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq posts_path
  end
end
