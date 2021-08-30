class DistilleriesScotchesController < ApplicationController
  def index
    @distillery = Distillery.find(params[:distillery_id])
    @scotches = @distillery.scotches
      after_action
  end

  def new
    scotch = Scotch.new
    @distillery = Distillery.find(params[:distillery_id])
  end

  def create
    distillery = Distillery.find(params[:distillery_id])
    scotch = distillery.scotches.create({
      name: params[:scotch][:name],
      single_malt: params[:scotch][:single_malt],
      year: params[:scotch][:year]
    })
    scotch.save
    redirect_to "/distilleries/#{distillery.id}/scotches"
    # render :action => :index
  end

  def after_action
    @scotches = @distillery.scotches.all.order(name: :asc)
    render :action => :index
  end
end
