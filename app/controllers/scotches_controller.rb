class ScotchesController < ApplicationController
  # def index
  #   require "pry"; binding.pry
  # end

  def index
    @scotches = Scotch.all.find_all do |scotch|
      scotch.single_malt == true
    end
  end

  def new
  end

  def create
    scotch = Scotch.create({
      name: params[:scotch][:name],
      single_malt: params[:scotch][:single_malt],
      year: params[:scotch][:year],
      distillery_id: params[:scotch][:distillery_id]
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
    redirect_to "/scotches/#{scotch.id}"
  end

  def destroy
    Scotch.destroy(params[:id])

    redirect_to '/scotches'
  end
end
