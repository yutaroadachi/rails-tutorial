require "rails_helper"

RSpec.describe "UsersSignup", type: :system do
  before do
    visit signup_path
  end

  it "無効なユーザー情報でユーザー登録する" do
    expect {
      fill_in "Name",         with: ""
      fill_in "Email",        with: "user@invalid"
      fill_in "Password",     with: "foo"
      fill_in "Confirmation", with: "bar"
      click_button "Create my account"

      expect(page).to have_content "form contains 4 errors."
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Email is invalid"
      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    }.to change(User, :count).by(0)

    expect(page).to have_current_path signup_path
  end

  it "有効なユーザー情報でユーザー登録する" do
    EXAMPLE_EMAIL = "user@example.com"

    expect {
      fill_in "Name",         with: "Example User"
      fill_in "Email",        with: EXAMPLE_EMAIL
      fill_in "Password",     with: "password"
      fill_in "Confirmation", with: "password"
      click_button "Create my account"

      expect(page).to have_content "Welcome to the Sample App!"
    }.to change(User, :count).by(1)

    expect(page).to have_current_path user_path(User.find_by(email: EXAMPLE_EMAIL).id)
  end
end
