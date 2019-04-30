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
     @review = Review.create(params)
     redirect to "/reviews/#{@review.id}"
   end
   
    get '/reviews/:id' do
      @review = Review.find(params[:id])
     erb :'reviews/show'
   end
end