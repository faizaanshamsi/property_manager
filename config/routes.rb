PropertyManagement::Application.routes.draw do
  resources :buildings, except: [:destroy, :update, :edit]
end
