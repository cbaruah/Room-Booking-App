Rails.application.routes.draw do

  get '/history/room/:id' => 'histories#room_history', as: :history_room
  get '/history/user/:id' => 'histories#user_history', as: :history_user
  get '/history/:id' => 'histories#email_notification', as: :email_notifier

  resources :room_histories
  resources :rooms
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/history/create/room/:id/date/:date/slot/:slot' => 'histories#create', as: :create_history
  get '/history/update/room/:id' => 'histories#update', as: :update_history

end
