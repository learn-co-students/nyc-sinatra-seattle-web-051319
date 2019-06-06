class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get "/landmarks/new" do 
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post "/landmarks" do 
    # binding.pry
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do 
    # binding.pry
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch "/landmarks/:id" do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    redirect to "/landmarks/#{@landmark.id}"
  end
end
