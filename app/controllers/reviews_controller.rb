require 'pry'
class ReviewsController < ApplicationController
  
  get '/index' do
     @reviews = Review.all
     erb :'/reviews/index'
   end
   
  
  get '/reviews' do
    erb :'/reviews/home'
  end
  
  get '/create' do
    erb :'/reviews/create'
  end
  
  post '/reviews' do
     @user = User.find_by(session[:id])
     @review = Review.create(params)
     @review.users_id = @user.id
     binding.pry
     @review.save
     redirect to "/reviews/#{@review.id}"
   end
   
    get '/reviews/:id' do
      @review = Review.find(params[:id])
     erb :'reviews/show'
   end
   
    get '/reviews/:id/edit' do 
     @user = User.find_by(session[:id])
     @review = Review.find(params[:id])
     if @user.id == @review.users_id
       erb :'/reviews/edit'
     else
       erb :'/reviews/home'
     end
   end
   
    post '/reviews/:id' do
     @review = Review.find_by_id(params[:id])
    # binding.pry
     @review.name = params[:name]
     @review.content = params[:content]
     @review.save
     #binding.pry
     redirect to "/reviews/#{@review.id}"
     
   end
   
    delete '/recipes/:id' do
      recipe = Recipe.find(params[:id])
      recipe.delete
      #binding.pry
      redirect to '/recipes'

  end
end