require 'rails_helper'

RSpec.describe "Sessions", type: :request do
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
end
