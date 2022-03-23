Rails.application.routes.draw do
  root "top#index"
  post "game" => "top#game", as: "game"
  get "game2" => "top#game2"
end
