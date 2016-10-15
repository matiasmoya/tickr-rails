Rails.application.routes.draw do
  root 'admin/tickets#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :admins, controllers: { sessions: 'admin/sessions'}

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tickets
      resources :ticket_messages
    end
  end

  namespace :admin do
    root to: redirect('/admin/tickets', status: 302)

    resources :tickets, only: [:index, :show, :edit, :update] do
      post 'claim', to: 'ticket_claims#create'
      resources :ticket_messages, only: :create
    end
  end
end
