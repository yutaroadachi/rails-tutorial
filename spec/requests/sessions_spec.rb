require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user1) { FactoryBot.create(:user) }

  describe "GET /login" do
    before do
      get login_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Log in | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "POST /login" do
    describe "remember me" do
      it "利用してログインし、cookiesにトークンが存在すること" do
        log_in_as(user1, remember_me: '1')
        expect(cookies[:remember_token]).to_not be_empty
      end

      it "利用せずログインし、cookiesにトークンが存在すること" do
        log_in_as(user1, remember_me: '1')
        delete logout_path

        log_in_as(user1, remember_me: '0')
        expect(cookies[:remember_token]).to be_empty
      end
    end
  end
end
