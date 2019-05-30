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
    # binding.pry
     @review.save
     redirect to "/reviews/#{@review.id}"
   end
   
    get '/reviews/:id' do
      find_review
     erb :'reviews/show'
   end
   
    get '/reviews/:id/edit' do 
     @user = User.find_by(session[:id])
     find_review
     if @user.id == @review.users_id
       erb :'/reviews/edit'
     else
       erb :'/reviews/sorry'
     end
   end
   
    patch '/reviews/:id' do
     find_review
    # binding.pry
     @review.name = params[:name]
     @review.content = params[:content]
     @review.save
     #binding.pry
     redirect to "/reviews/#{@review.id}"
     
   end
   
    delete '/reviews/:id' do
      find_review
      #binding.pry
      @review.delete
      redirect to '/reviews'

  end
end