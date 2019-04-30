class ReviewsController < ApplicationController
  
  get '/reviews' do
    erb :'/reviews/home'
  end
  
  get '/create' do
    erb :'/reviews/create'
  end
end