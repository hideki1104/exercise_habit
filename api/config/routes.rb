Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'user/auth/', controllers: {
          registrations: 'api/v1/user/auth/registrations',
          sessions: 'api/v1/user/auth/sessions'
      }
      mount_devise_token_auth_for 'Admin', at: 'admin/auth/', controllers: {
        sessions: 'api/v1/admin/auth/sessions'
      }
    end
  end
  resources :users, only: [:show, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :weights, only: [:create, :index, :show, :edit, :update]
  resources :genres, only: [:create, :index, :update, :destroy]
  resources :trainings, only: [:create, :index,  :show, :update, :destroy] do
    resources :training_likes, only: [:create, :show, :destroy]
  end
  get 'recommended_trainings' => 'trainings#recommended_trainings'
  get 'recent_trainings' => 'trainings#recent_trainings'
  get 'favorite_trainings' => 'trainings#favorite_trainings'
  resources :histories, only: [:create, :index]
  resources :posts, only: [:create, :index] do
    resources :likes, only: [:create, :show, :destroy]
    resources :comments, only: [:create, :index]
  end
end
