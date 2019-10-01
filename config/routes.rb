Rails.application.routes.draw do
  root to: "pay_periods#index"
  resources :shift_reports, only: [:create]
  resources :pay_periods, only: [:index]
end
