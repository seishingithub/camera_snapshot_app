class CamerasController < ApplicationController

  def index
    @cameras = Camera.all
  end

  def new

  end

  def create
    @camera = Camera.new(
      name: params[:camera][:name],
      description: params[:camera][:description]
    )
    @camera.save
    redirect_to '/cameras' # list
  end


  def show
    @camera = Camera.find(params[:id])
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])
    @camera.update(
      name: params[:camera][:name],
      description: params[:camera][:description]
    )
    @camera.save
    redirect_to "/cameras/#{@camera.id}"
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to '/cameras'
  end

end
