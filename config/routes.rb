HackdayGameRanking::Application.routes.draw do
  match 'profiles/:player_name' => 'profiles#show_profile'
  match 'profiles' => 'profiles#index'
end
