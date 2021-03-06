require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "restowiththebesto"
  end

  get "/" do
    erb :welcome
    #welcome page
  end
  
  helpers do
    def logged_in?
    #binding.pry 
    !!session[:user_id]
   # binding.pry
    end 
    
    def current_user
      
      User.find_by(session[:user_id])
    end
    
    def find_review
      @review = Review.find(params[:id])
    end
  end
  
   

end
