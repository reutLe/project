Rails.application.routes.draw do
  resources :subscribes
  resources :activities do
    member do
      get 'like'
    end
    collection do
      get 'hot'
    end
  end

  resources :users do
  collection do
    get 'login'
    post 'login'
    get 'signOut'
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
