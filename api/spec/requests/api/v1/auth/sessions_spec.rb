require 'rails_helper'

RSpec.describe "Api::V1::Auth::Sessions", type: :request do
  context '正常:' do
    context 'メールアドレス、パスワードが正しい場合' do
      before do
        sign_up_data = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: sign_up_data

        sign_in_data = {email: "test@example.com", password: "password"}
        post api_user_session_path, params:sign_in_data
      end
      it 'レスポンスが200で返却されること' do
        expect(response.status).to eq(200)
      end
    end
  end

  context '異常:' do
    context 'メールアドレスがない場合' do
      before do
        sign_up_data = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: sign_up_data

        sign_in_data = {email: "", password: "password"}
        post api_user_session_path, params:sign_in_data
      end

      it 'レスポンスで401が返却されること' do
        expect(response.status).to eq(401)
      end

      it 'レスポンスステータスがfalseで返却されること' do
        response_data = JSON.parse(response.body)
        expect(response_data["success"]).to eq(false)
      end
    end

    context 'パスワードがない場合' do
      before do
        sign_up_data = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: sign_up_data

        sign_in_data = {email: "test@example.com", password: ""}
        post api_user_session_path, params:sign_in_data
      end

      it 'レスポンスが401で返却されること' do
        expect(response.status).to eq(401)
      end

      it 'レスポンスステータスがfalseで返却されること' do
        response_data = JSON.parse(response.body)
        expect(response_data["success"]).to eq(false)
      end
    end
  end
end
