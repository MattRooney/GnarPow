class RegisteredUserCanLoginTest < ActionDispatch::IntegrationTest
  test "a registered user can login" do
    login_a_user

    assert page.has_content?("Logged in as Matt")
    assert page.has_content?("Logout")
  end

  def login_a_user
    user = User.create(username: "Matt",
                       password: "gnargnar")
    visit login_path

    within(".login_form") do
      fill_in "Username", with: "Matt"
      fill_in "Password", with: "gnargnar"
      click_button "Login"
    end
  end
end
