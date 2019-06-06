class FiguresController < ApplicationController
  # add controller methods

  get "/figures" do 
    @figures = Figure.all
    erb :'/figures/index'
  end

end
