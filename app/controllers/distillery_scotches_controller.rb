class DistilleryScotchesController < ApplicationController
  def index
    @distillery = Distillery.find(params[:distillery_id])
    @scotches = @distillery.scotches
  end
end
