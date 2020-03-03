Rails.application.routes.draw do
  root "pages#home"

  # Redirect all unknown routes to root_url / keep at the bottom of routes.rb
  get '*path' => redirect('/')
end
