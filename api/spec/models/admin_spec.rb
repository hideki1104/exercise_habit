require 'rails_helper'

RSpec.describe Admin, type: :model do

  it 'メールアドレス、パスワードがある場合、有効である' do
    admin = Admin.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )

    expect(admin).to be_valid
  end
  it 'メールアドレスがない場合、無効である' do
    admin = Admin.new(
      name: "example",
      email: nil,
      password: "password",
    )
    admin.valid?
    expect(admin.errors[:email]).to include("can't be blank")
  end

  it 'メールアドレスが正しい形式でない場合、無効である' do
    admin = Admin.new(
      name: "example",
      email: "testexample",
      password: "password",
    )
    admin.valid?
    expect(admin.errors[:email]).to include("is not an email")
  end

  it '重複したメールアドレスの場合、無効である' do
    admin = Admin.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )
    admin.save

    admin = Admin.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )
    admin.valid?
    expect(admin.errors[:email]).to include("has already been taken")
  end

  it 'パスワードがない場合、無効である' do
    admin = Admin.new(
      name: "example",
      email: "test@example.com",
      password: nil,
    )
    admin.valid?
    expect(admin.errors[:password]).to include("can't be blank")
  end
end