class ScotchesController < ApplicationController
  def index
    @scotches = Scotch.all.find_all do |scotch|
      scotch.single_malt == true
    end
  end

  def new
  end

  def create
    scotch = Scotch.create(scotch_params)
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
    scotch.update(scotch_params)
    if params[:scotch][:single_malt] == '1'
      scotch.single_malt = true
    else params[:scotch][:single_malt] == '0'
      scotch.single_malt = false
    end
    scotch.save
    redirect_to "/scotches/#{scotch.id}"
  end

  def destroy
    Scotch.destroy(params[:id])
    redirect_to '/scotches'
  end

  private
    def scotch_params
      params.permit(:name, :single_malt, :year)
    end
end
