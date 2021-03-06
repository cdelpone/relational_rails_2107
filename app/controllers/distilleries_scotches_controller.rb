class DistilleriesScotchesController < ApplicationController
  def index
    @distillery = Distillery.find(params[:distillery_id])
    if params[:order]
      @scotches = @distillery.sort_alpha
    elsif params[:num]
      @scotches = @distillery.greater_than("#{params[:num]}")
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

private
  def scotch_params
    params.permit(:name, :year, :single_malt)
   end
end
