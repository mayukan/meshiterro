Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    #今まではresourcesでしたが、ここでは、resourceとなっている点に注目してください。 単数形にすると、/:idがURLに含まれなくなります。
    #いいね機能の場合は「1人のユーザーは1つの投稿に対して1回しかいいねできない」
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end