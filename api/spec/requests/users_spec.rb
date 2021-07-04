require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ユーザー更新機能" do
    context "正常：" do
      before do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
        response_data = JSON.parse(response.body)

        params = {name: "test", email: "test@example.com", height: 170, sex: 0, birthday: "1990-01-01", training_type: 0}
        patch "/users/#{response_data['data']['id']}", params: params
      end

      it 'レスポンスが200で返却されること' do
        expect(response.status).to eq(200)
      end

      it '名前の値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['name']).to eq("test")
      end

      it 'メールアドレスの値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['email']).to eq("test@example.com")
      end

      it '身長の値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['height']).to eq(170)
      end

      it '性別の値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['sex']).to eq(0)
      end

      it '生年月日の値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['birthday']).to eq('1990-01-01')
      end

      it 'トレーニングタイプの値が正しく更新されていること' do
        response_data = JSON.parse(response.body)
        expect(response_data['training_type']).to eq(0)
      end
    end

    context "異常" do
    end
  end

  describe "ユーザー取得機能" do
    context "正常：" do
      before do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
      end
    end

    context "異常" do
    end
  end
end
