require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  it '名前、メールアドレス、パスワードがある場合、有効である' do

    expect(@user).to be_valid
  end

  it 'メールアドレスがない場合、無効である' do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it 'メールアドレスが正しい形式でない場合、無効である' do
    @user.email = "testexample"
    @user.valid?
    expect(@user.errors[:email]).to include("is not an email")
  end

  it '重複したメールアドレスの場合、無効である' do
    user       = create(:user)
    after_user = build(:user)
    after_user.email = user.email
    after_user.valid?
    expect(after_user.errors[:email]).to include("has already been taken")
  end

  it 'パスワードがない場合、無効である' do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end
end