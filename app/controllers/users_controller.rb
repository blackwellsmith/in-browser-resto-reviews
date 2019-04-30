class UsersController < ApplicationController
  
   get '/signup' do
      erb :'users/new'
  end
  
   post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/reviews'
    end
  end
  
  get '/login' do
    erb :'users/login'
  end 
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/reviews"
    else
      redirect to '/login'
    end
  end
  
  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end
  
end