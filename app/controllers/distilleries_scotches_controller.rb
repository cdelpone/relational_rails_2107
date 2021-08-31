class DistilleriesScotchesController < ApplicationController
  def index
    @distillery = Distillery.find(params[:distillery_id])
    if params[:order]
      @scotches = @distillery.sort_alpha
    elsif params[:year]
      @scotches = @distillery.greater_than_10
    else
      @scotches = @distillery.scotches
    end
  end

  def new
    @scotch = Scotch.new
    @distillery = Distillery.find(params[:distillery_id])
  end

  def create
    distillery = Distillery.find(params[:distillery_id])

    @scotch = distillery.scotches.create!(scotch_params)
    redirect_to "/distilleries/#{distillery.id}/scotches"
  end

  def scotch_params
    params.permit(:name, :year, :single_malt)
   end
end
