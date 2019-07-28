require "rails_helper"

RSpec.describe "SiteLayout", type: :system do
  describe "Homeページ" do
    before do
      visit root_path
    end

    describe "各リンクが正常に機能していること" do
      it "ロゴ" do
        click_link "sample app"
        expect(page).to have_current_path root_path
      end

      it "Home" do
        click_link "Home"
        expect(page).to have_current_path root_path
      end

      it "Help" do
        click_link "Help"
        expect(page).to have_current_path help_path
      end

      it "About" do
        click_link "About"
        expect(page).to have_current_path about_path
      end

      it "Contact" do
        click_link "Contact"
        expect(page).to have_current_path contact_path
      end

      it "Sign up now!" do
        click_on "Sign up now!"
        expect(page).to have_current_path signup_path
      end
    end
  end
end
