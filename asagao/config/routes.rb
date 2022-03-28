Rails.application.routes.draw do
  root "top#index"
  post "game" => "top#game", as: "game"
  get "game1" => "top#game1", as: "game1"
  get "game2" => "top#game2"
  get "game/result1" => "top#result1", as: "result1"
  get "game/result2" => "top#result2", as: "result2"
  get "game/result20" => "top#result20", as: "result20"
  get "game3" => "top#game3"
  get "game/result3" => "top#result3", as: "result3"
  get "game4" => "top#game4"
  get "game/result4" => "top#result4", as: "result4"
  get "game/result40" => "top#result40", as: "result40"
  get "finish" => "top#finish"
end
