require 'rails_helper'

include SessionsHelper

RSpec.describe "SessionsHelper", type: :helper do
  let(:user1) { FactoryBot.create(:user) }

  describe "#current_user" do
    before do
      remember(user1)
    end

    it "sessionがnilの時正しいユーザーを返すこと" do
      expect(user1).to eq current_user
    end

    it "remember_digestが不正の時nilを返すこと" do
      user1.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to eq nil
    end
  end
end
