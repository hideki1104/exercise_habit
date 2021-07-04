require 'rails_helper'

RSpec.describe Weight, type: :model do
  before do
    @weight = build(:weight)
  end

  it "体重、ユーザーIDがある場合、有効である" do
    expect(@weight.valid?).to eq(true)
  end

  it "体重がない場合、無効である" do
    @weight.weight = nil
    @weight.valid?
    expect(@weight.errors[:weight]).to include("can't be blank")
  end

  it "体重が数値でない場合、無効である" do
    @weight.weight = "test"
    @weight.valid?
    expect(@weight.errors[:weight]).to include("is not a number")
  end

  it "ユーザーIDがない場合、無効である" do
    @weight.user_id = nil
    @weight.valid?
    expect(@weight.errors[:user_id]).to include("can't be blank")
  end
end
