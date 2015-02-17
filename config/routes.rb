Rails.application.routes.draw do
  mount Rhinoart::Engine, at: "/admin"
  root to: 'pages#index'
  get '*url' => 'pages#internal', as: :page
end
