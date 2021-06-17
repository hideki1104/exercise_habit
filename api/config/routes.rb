Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'user/auth/', controllers: {
          registrations: 'api/v1/auth/registrations',
          sessions: 'api/v1/user/auth/sessions'
      }
      mount_devise_token_auth_for 'Admin', at: 'admin/auth/', controllers: {
        sessions: 'api/v1/admin/auth/sessions'
      }
    end
  end
end
