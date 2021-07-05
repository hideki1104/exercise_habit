require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ユーザー更新機能" do
    context "正常：" do
      context 'パラメータが正しい場合、' do
        before do
          user = create(:user)

          params = {name: "test", email: "test@example.com", height: 180, sex: 1, birthday: "1990-02-01", training_type: 1}
          patch "/users/#{user.id}", params: params
          @response_data = JSON.parse(response.body)
        end

        it 'レスポンスが200で返却されること' do
          expect(@response.status).to eq(200)
        end

        it '名前の値が正しく更新されていること' do
          expect(@response_data['name']).to eq("test")
        end

        it 'メールアドレスの値が正しく更新されていること' do
          expect(@response_data['email']).to eq("test@example.com")
        end

        it '身長の値が正しく更新されていること' do
          expect(@response_data['height']).to eq(180)
        end

        it '性別の値が正しく更新されていること' do
          expect(@response_data['sex']).to eq(1)
        end

        it '生年月日の値が正しく更新されていること' do
          expect(@response_data['birthday']).to eq('1990-02-01')
        end

        it 'トレーニングタイプの値が正しく更新されていること' do
          expect(@response_data['training_type']).to eq(1)
        end
      end
    end

    context "異常" do
      before do
        @user = create(:user)
      end

      context 'メールアドレスの形式が異なる場合、' do
        before do
          params = {email: "testexample"}

          patch "/users/#{@user.id}", params: params
          @response_update_data = response.body
        end

        it 'レスポンスエラーが返却されること' do
          expect(@response_update_data).to include('is not an email')
        end
      end

      context '身長が数値でない場合、' do
        before do
          params = {height: "test"}

          patch "/users/#{@user.id}", params: params
          @response_update_data = response.body
        end

        it 'レスポンスエラーが返却されること' do
          expect(@response_update_data).to include('is not a number')
        end
      end

      context '性別が数値でない場合、' do
        before do
          params = {sex: "test"}

          patch "/users/#{@user.id}", params: params
          @response_update_data = response.body
        end

        it 'レスポンスエラーが返却されること' do
          expect(@response_update_data).to include('is not a number')
        end
      end

      context 'トレーニングタイプが数値でない場合、' do
        before do
          params = {training_type: "test"}

          patch "/users/#{@user.id}", params: params
          @response_update_data = response.body
        end

        it 'レスポンスエラーが返却されること' do
          expect(@response_update_data).to include('is not a number')
        end
      end
    end
  end

  describe "ユーザー取得機能" do
    before do
      @user = create(:user)
      get "/users/#{@user.id}"
    end

    it 'レスポンスで200が返却されること' do
      expect(response.status).to eq(200)
    end

    it '正しい値が取得できること' do
      response_data = JSON.parse(response.body)

      expect(response_data['name']).to eq(@user.name)
      expect(response_data['email']).to eq(@user.email)
      expect(response_data['height']).to eq(@user.height)
      expect(response_data['birthday']).to eq(@user.birthday.to_s)
      expect(response_data['sex']).to eq(@user.sex)
      expect(response_data['training_type']).to eq(@user.training_type)
    end
  end
end
