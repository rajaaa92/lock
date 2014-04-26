Rails.application.routes.draw do
  get "lock/login", to: "lock#login", as: "lock_login"
  post "lock/unlock", to: "lock#unlock", as: "unlock"
  get '/lock' => 'lock#lock'
end
