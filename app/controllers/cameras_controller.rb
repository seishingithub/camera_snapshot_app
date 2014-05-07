class CamerasController < ApplicationController

  def index
    @cameras = Camera.all
  end

  def new

  end

  def create
    @camera = Camera.new
    @camera.name = params[:camera][:name]
    @camera.description = params[:camera][:description]
    @camera.save
    redirect_to '/cameras'
  end


  def show
    @camera = Camera.find(params[:id])
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])
    @camera.name = params[:camera][:name]
    @camera.description = params[:camera][:description]
    @camera.save
    redirect_to "/cameras/#{@camera.id}"
  end

end
