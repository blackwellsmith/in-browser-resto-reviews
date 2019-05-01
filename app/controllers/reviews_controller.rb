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
   
    get '/reviews/:id/edit' do 
     @review = Review.find(params[:id])
     erb :'/reviews/edit'
   end
   
    patch '/reviews/:id' do
     @review = Review.find(params[:id])
     @review.name = params[:name]
     @review.content = params[:content]
     @review.save
     redirect to "/reviews/#{@review.id}"
     
   end
   
    delete '/recipes/:id' do
      recipe = Recipe.find(params[:id])
      recipe.delete
      #binding.pry
      redirect to '/recipes'

  end
end