require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Example User",
                        email: "user@example.com",
                        password: "foobar",
                        password_confirmation: "foobar")
  }

  it "name, emailがあれば有効な状態であること" do
    expect(user).to be_valid
  end

  it "nameが空文字であれば無効な状態であること" do
    user.name = " "
    expect(user).to_not be_valid
  end

  it "emailが空文字であれば無効な状態であること" do
    user.email = " "
    expect(user).to_not be_valid
  end

  it "nameが51文字以上であれば無効な状態であること" do
    user.name = "a" * 51
    expect(user).to_not be_valid
  end

  it "emailが256文字以上であれば無効な状態であること" do
    user.email = "a" * 244 + "@example.com"
    expect(user).to_not be_valid
  end

  it "emailのフォーマットが適切であれば有効な状態であること" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it "emailのフォーマットが不適切であれば無効な状態であること" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

  it "emailが重複していれば無効な状態であること" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it "passwordが空文字であれば無効な状態であること" do
    user.password = user.password_confirmation = " " * 6
    expect(user).to_not be_valid
  end

  it "passwordが6文字未満であれば無効な状態であること" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to_not be_valid
  end
end
