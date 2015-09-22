Rails.application.routes.draw do
  resource :audit_requests
  root to: 'requests#index', defaults: { format: :json }
end
