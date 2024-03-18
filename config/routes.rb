Rails.application.routes.draw do
  post 'signup/create', to: 'signup#create', :as => :create_signup
  #get 'signup/new', :as => :new_signup
  root 'signup#index', to: 'signup#index', :as => :root
end

#gcloud beta runtime-config configs variables set \
#--config-name=flex-env-config-1 --is-text \
#SECRET_KEY_BASE "6ba05ac2ed19871cf87318c9814a918a214fc8e2efad062e37ab28568247e059ab336c50ebeb6852d1a6d275cd2f63ecfd61b4d26acc8645e272b1a0b9d24a07"
