require './config/environment'

class App < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fwitter_secret"
   # set :views, Proc.new { File.join(root, "../views/") }
  end

  get '/' do
		erb :index
		#binding.pry
	end
	
	helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end