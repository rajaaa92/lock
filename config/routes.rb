Rails.application.routes.draw do
  match "lock/login", to: "lock#login", as: "lock_login"
  post "lock/unlock", to: "lock#unlock", as: "unlock"
  match '/lock' => 'lock#lock'
end
