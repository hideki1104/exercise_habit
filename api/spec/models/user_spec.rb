require 'rails_helper'

RSpec.describe User, type: :model do

  it '名前、メールアドレス、パスワードがある場合、有効である' do
    user = User.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )

    expect(user).to be_valid
  end

  it 'メールアドレスがない場合、無効である' do
    user = User.new(
      name: "example",
      email: nil,
      password: "password",
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'メールアドレスが正しい形式でない場合、無効である' do
    user = User.new(
      name: "example",
      email: "testexample",
      password: "password",
    )
    user.valid?
    expect(user.errors[:email]).to include("is not an email")
  end

  it '重複したメールアドレスの場合、無効である' do
    user = User.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )
    user.save

    user = User.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'パスワードがない場合、無効である' do
    user = User.new(
      name: "example",
      email: "test@example.com",
      password: nil,
    )
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end