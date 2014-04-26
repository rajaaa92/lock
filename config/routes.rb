Rails.application.routes.draw do
  get "lock/login", to: "lock#login", as: "lock_login"
  post "lock/unlock", to: "lock#unlock", as: "unlock"
  post '/lock' => 'lock#lock'
end
