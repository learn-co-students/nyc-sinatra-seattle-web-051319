class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure_name])

      if params[:new_landmark] != ""
        @landmark = Landmark.create(name: params[:new_landmark], figure: @figure)
      end

      if params[:new_title] != ""
        @title = Title.create(name: params[:new_title])
        FigureTitle.create(figure: @figure, title: @title)
      end

      if params[:figure][:title_ids] != nil
        @title_ids = params[:figure][:title_ids]
        @title_ids.each do |title_id|
          @title = Title.find(title_id)
          FigureTitle.create(title: @title, figure: @figure)
        end
      end

      if params[:figure][:landmark_ids] != nil
        @landmark_ids = params[:figure][:landmark_ids]
        @landmark_ids.each do |landmark_id|
          @landmark = Landmark.find(landmark_id)
          @landmark.update(figure: @figure)
        end
      end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = @figure.titles
    @titles_count = @titles.count
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure_name])
    if params[:new_landmark] != []
      @landmark = Landmark.create(name: params[:new_landmark], figure: @figure)
    else
    end
    redirect to "/figures/#{@figure.id}"
  end

end
