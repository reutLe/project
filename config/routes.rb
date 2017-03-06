Rails.application.routes.draw do
  resources :activities
  resources :users do
  collection do
    get 'login'
    post 'login'
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
