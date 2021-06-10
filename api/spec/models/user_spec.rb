require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前、メール、パスワードがある場合、有効である' do
    user = User.new(
      name: "example",
      email: "test@example.com",
      password: "password",
    )

    expect(user).to be_valid
  end

  it '名前がない場合、無効である'
  it 'メールアドレスがない場合、無効である'
  it 'メールアドレスが正しい形式でない場合、無効である'
  it '重複したメールアドレスの場合、無効である'
  it 'パスワードがない場合、無効である'
  it 'パスワードと確認用パスワードが異なる場合、無効である'
end