require "rails_helper"

RSpec.describe "UsersLogin", type: :system do
  let(:user1) { FactoryBot.create(:user) }

  before do
    visit login_path
  end

  it "無効なユーザー情報でログインする" do
    expect(page).to have_current_path login_path

    fill_in "Email",    with: ""
    fill_in "Password", with: ""
    click_button "Log in"

    expect(page).to have_current_path login_path
    expect(page).to have_content "Invalid email/password combination"

    visit root_path

    expect(page).to_not have_content "Invalid email/password combination"
  end

  it "有効なユーザー情報でログインし、その後ログアウトする" do
    fill_in "Email",    with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    expect(page).to have_current_path user_path(user1)

    within "header" do
      expect(page).to have_content "Users"
      expect(page).to have_content "Account"
      expect(page).to have_content "Profile"
      expect(page).to have_content "Settings"
      expect(page).to have_content "Log out"
      expect(page).to_not have_content "Log in"
    end

    click_link "Log out"

    expect(page).to have_current_path root_path

    within "header" do
      expect(page).to_not have_content "Users"
      expect(page).to_not have_content "Account"
      expect(page).to_not have_content "Profile"
      expect(page).to_not have_content "Settings"
      expect(page).to_not have_content "Log out"
      expect(page).to have_content "Log in"
    end
  end
end
