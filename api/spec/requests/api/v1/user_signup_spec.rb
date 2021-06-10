require 'rails_helper'

describe 'User SignUp API' do
  context '正常: ' do
    context 'パラメータが正しい場合' do
      before do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
      end

      it 'レスポンスが200で返却されること' do
        expect(response.status).to eq(200)
      end

      it 'ステータスがsuccessで返却されること' do
        response_data = JSON.parse(response.body)
        expect(response_data['status']).to eq('success')
      end

      it 'レスポンスの値が正しいこと' do
        response_data = JSON.parse(response.body)
        expect(response_data['data']['email']).to eq("test@example.com")
      end
    end
  end

  context '異常: ' do
    context '同じメールアドレスが登録された場合' do
      before do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
      end

      it 'レスポンスで422 Unprocessable Entityが返却されること' do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
        expect(response.status).to eq(422)
      end

      it 'レスポンスがfalseで返却されること' do
        params = {email: "test@example.com", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
        response_data = JSON.parse(response.body)
        expect(response_data['status']).to eq('error')
      end
    end

    context 'メールアドレスが正しい形式でない場合' do
      before do
        params = {email: "testexample", password: "password", confirmation_password: "password"}
        post api_user_registration_path, params: params
      end

      it 'レスポンスで422 Unprocessable Entityが返却されること' do
        expect(response.status).to eq(422)
      end

      it 'レスポンスがfalseで返却されること' do
        response_data = JSON.parse(response.body)
        expect(response_data['status']).to eq('error')
      end
    end

    context 'パスワードと確認用パスワードが違う場合' do
      before do
        params = {email: "testexample", password: "password", confirmation_password: "passwordd"}
        post api_user_registration_path, params: params
      end

      it 'レスポンスで422 Unprocessable Entityが返却されること' do
        expect(response.status).to eq(422)
      end

      it 'レスポンスがfalseで返却されること' do
        response_data = JSON.parse(response.body)
        expect(response_data['status']).to eq('error')
      end
    end
    # パスワードが◯文字以下の場合、レスポンスでエラーが返却されること
  end
end