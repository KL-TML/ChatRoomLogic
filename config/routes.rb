Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'chat#login'
  post 'add_user' => 'chat#add_user'
  get  'chat_room' => 'chat#chat_room'

end
