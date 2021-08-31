class DistilleriesController < ApplicationController
  def index
    @distilleries = Distillery.order_by_creation
  end

  def new
  end

  def create
    distillery = Distillery.create(distillery_params)
    redirect_to '/distilleries'
  end

  def show
    @distillery = Distillery.find(params[:id])
  end

  def edit
    @distillery = Distillery.find(params[:id])
  end

  def update
    distillery = Distillery.find(params[:id])
    distillery.update(distillery_params)
    distillery.save
    redirect_to "/distilleries/#{distillery.id}"
  end

  def destroy
    Distillery.destroy(params[:id])
    redirect_to '/distilleries'
  end

private
  def distillery_params
    params.permit(:name, :scotland_location, :established)
  end
end
