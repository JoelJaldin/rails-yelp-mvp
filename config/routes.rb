Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    resources :restaurants do
      resources :reviews, only: [ :index, :new, :create ]
    end
    resources :reviews, only: [ :show, :edit, :update, :destroy ]
  end
end

# restaurants/:id/reviews/:id
# restaurants/restaurant_id/reviews/id
#  = Restaurant.find(params[:restaurant_id])
