require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    before do
      get signup_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
    end
  end
end
