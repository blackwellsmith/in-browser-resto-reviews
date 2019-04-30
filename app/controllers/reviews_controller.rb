class ReviewsController < ApplicationController
  
  get '/reviews' do
    erb :'/reviews/new'
  end
end