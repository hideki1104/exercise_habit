require 'rails_helper'

RSpec.describe Training, type: :model do
  before do
    @genre     = create(:genre)
    @training = build(:training)
  end

  it '名前、URL、トレーニングタイプ、難易度タイプ、ジャンルIDがある場合、有効である' do
    @training.genre_id = @genre.id
    expect(@training).to be_valid
  end

  it '名前がない場合、無効である' do
    @training.name = nil
    @training.valid?
    expect(@training.errors[:name]).to include("can't be blank")
  end

  it 'urlがない場合、無効である' do
    @training.url = nil
    @training.valid?
    expect(@training.errors[:url]).to include("can't be blank")
  end

  it 'URLが9文字以下の場合、無効である' do
    @training.url = "123456789"
    @training.valid?
    expect(@training.errors[:url]).to include("is too short (minimum is 10 characters)")
  end

  it 'URLが11文字以上の場合、無効である' do
    @training.url = "12345678912"
    @training.valid?
    expect(@training.errors[:url]).to include("is too long (maximum is 10 characters)")
  end

  it 'トレーニングタイプがない場合、無効である' do
    @training.training_type = nil
    @training.valid?
    expect(@training.errors[:training_type]).to include("can't be blank")
  end

  it 'トレーニングタイプが数値でない場合、無効である' do
    @training.training_type = "test"
    @training.valid?
    expect(@training.errors[:training_type]).to include("is not a number")
  end

  it '難易度タイプがない場合、無効である' do
    @training.difficuly_type = nil
    @training.valid?
    expect(@training.errors[:difficuly_type]).to include("can't be blank")
  end

  it '難易度タイプが数値でない場合、無効である' do
    @training.difficuly_type = "test"
    @training.valid?
    expect(@training.errors[:difficuly_type]).to include("is not a number")
  end

  it 'ジャンルIDがない場合、無効である' do
    @training.genre_id = nil
    @training.valid?
    expect(@training.errors[:genre_id]).to include("can't be blank")
  end
end
