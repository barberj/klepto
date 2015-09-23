Rails.application.routes.draw do
  resources :audit_requests
  root to: 'requests#index', defaults: { format: :json }
end
