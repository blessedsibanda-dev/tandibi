Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  authenticate :user do
    resources :timelines, only: [:index, :show], param: :username
  end

  root to: "home#index"
end
