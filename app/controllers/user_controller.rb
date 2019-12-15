class UsersController < App
  
  get "/signup" do
    erb :'/users/signup'
  end
  
  post "/signup" do
  end
  
  get "/login" do
    erb :'/users/login'
  end
  
  post "/login" do
  end
  
  
  get "/logout" do
  end
  
  get "/users/:slug" do
  end
  
  
end