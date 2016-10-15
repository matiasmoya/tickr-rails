Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :admins

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tickets
      resources :ticket_messages
    end
  end

  namespace :admin do
    root to: redirect('/admin/tickets', status: 302)

    resources :tickets do
      post 'claim', to: 'ticket_claims#create'
    end

    resources :ticket_messages
  end
end
