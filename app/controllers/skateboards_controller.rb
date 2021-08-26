class SkateboardsController < ApplicationController
  def index
    @skateboards = Skateboard.all
  end

  def show
    @skateboard = Skateboard.find(params[:id])
  end

  def edit
    @skateboard = Skateboard.find(params[:id])
  end

  def new
  end

  def create
    skateboard = Skateboard.create({
      board_name: params[:skateboard][:board_name],
      cost: params[:skateboard][:cost],
      nose: params[:skateboard][:nose],
      brand_id: params[:skateboard][:brand_id]
      })

    redirect_to '/skateboards'
  end

  def update
    skateboard = Skateboard.find(params[:id])

    skateboard.update({
      board_name: params[:skateboard][:board_name],
      cost: params[:skateboard][:cost],
      nose: params[:skateboard][:nose],
      brand_id: params[:skateboard][:brand_id]
      })

    skateboard.save

    redirect_to "/skateboards/#{skateboard.id}"
  end

  def destroy
    Skateboard.destroy(params[:id])
    redirect_to '/skateboards'
  end
end
