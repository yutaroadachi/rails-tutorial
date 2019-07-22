require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages/home" do
    before do
      get static_pages_home_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /static_pages/help" do
    before do
      get static_pages_help_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /static_pages/about" do
    before do
      get static_pages_about_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "About | Ruby on Rails Tutorial Sample App"
    end
  end
end
