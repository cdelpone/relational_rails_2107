class DistilleriesScotchesController < ApplicationController
  def index
    @distillery = Distillery.find(params[:distillery_id])
    @scotches = if params[:order] = 'alphabetical'
      @distillery.sort_alpha
    else
      @distillery.scotches
    end
  end

  def new
    @scotch = Scotch.new
    @distillery = Distillery.find(params[:distillery_id])
  end

  def create
    distillery = Distillery.find(params[:distillery_id])
    @scotch = distillery.scotches.create({
                  name: params[:name],
                  single_malt: params[:single_malt],
                  year: params[:year]
                })
    redirect_to "/distilleries/#{distillery.id}/scotches"
  end
end
