module Api
  module V1
    module User
      class UsersController < ApplicationController

        def index
          @user = User.all
          render json: @user
        end

        def update
          if @user.update(user_params)
            render json: @user
          else
            render json: @user.errors
          end
        end

        private
          def user_params
            params.require(:user).permit(:name, :email)
          end
      end
    end
  end
end