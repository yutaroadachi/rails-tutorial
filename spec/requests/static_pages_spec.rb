require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    before do
      get root_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /help" do
    before do
      get help_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /about" do
    before do
      get about_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "About | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /contact" do
    before do
      get contact_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
    end

    it "適切なタイトルが表示されていること" do
      assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
    end
  end
end
