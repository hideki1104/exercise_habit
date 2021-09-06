require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @genre = build(:genre)
  end

  it '名前がある場合、有効である' do
    expect(@genre).to be_valid
  end

  it '名前がない場合、無効である' do
    @genre.name = nil
    @genre.valid?
    expect(@genre.errors[:name]).to include("can't be blank")
  end
end
