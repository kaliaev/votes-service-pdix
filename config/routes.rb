Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/api/ratings" do
    constraints(:accept =>
      "application/vnd.pauldix.voteservice-v1+json") do
        controller :votes do
          
          put "/entries/:entry_id/users/:user_id/vote" => "votes#create"
          
          get "/users/:user_id/up" => "votes#entry_ids_voted_up_for_user"
          
          get "/users/:user_id/down" => "votes#entry_ids_voted_down_for_user"
          
          get "/entries/totals" => "votes#totals_for_entries"
          
          get "/users/:user_id/votes" => "votes#votes_for_users"
          
          get "/users/:user_id/totals" => "votes#totals_for_user"
          
        end
      end
  end
  
  root 'script#index'
end
