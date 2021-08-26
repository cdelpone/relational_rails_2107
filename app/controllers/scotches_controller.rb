class ScotchesController < ApplicationController
  def index
    @scotches = Scotch.all
  end

  def new
  end

  def create
    scotch = Scotch.new({
      name: params[:scotch][:name],
      single_malt: params[:scotch][:single_malt],
      year: params[:scotch][:year]
    })
    scotch.save
    redirect_to '/scotches'
  end

  def show
    @scotch = Scotch.find(params[:id])
  end

  def edit
    @scotch = Scotch.find(params[:id])
  end

  def update
    scotch = Scotch.find(params[:id])

    scotch.update({
      name: params[:scotch][:name],
      single_malt: params[:scotch][:single_malt],
      year: params[:scotch][:year]
    })
    scotch.save
    redirect_to '/scotches/#{scotch.id}'
  end

  def destroy
    Scotch.destroy(params[:id])

    redirect_to '/scotches'
  end
end
