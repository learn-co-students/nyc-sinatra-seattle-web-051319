class FiguresController < ApplicationController
  # add controller methods

  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post "/figures" do 
    
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get "/figures/:id/edit" do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch "/figures/:id" do 
    
    @figure = Figure.find(params[:id])
    
    @figure.update(name: params[:figure][:name])
    # binding.pry
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:figure][:landmark_name])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:figure][:title_ids])
    end
    
    redirect to "/figures/#{@figure.id}"
  end

end
