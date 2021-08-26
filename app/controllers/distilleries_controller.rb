class DistilleriesController < ApplicationController
  def index
    @distilleries = Distillery.all
    # in the distilleryscotchescontroller
    #     @distillery = Distillery.find(params[:id])
    # for helper private helper method
    #     @distillery_scotches = distillery_scotches
  end

  def new
  end

  def create
    distillery = Distillery.new({
      name: params[:distillery][:name],
      scotland_location: params[:distillery][:scotland_location],
      established: params[:distillery][:established],
      updated_at: params[:distillery][:updated_at],
      created_at: params[:distillery][:created_at]
    })
    distillery.save
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

    distillery.update({
      name: params[:distillery][:name],
      scotland_location: params[:distillery][:scotland_location],
      established: params[:distillery][:established],
      updated_at: params[:distillery][:updated_at],
      created_at: params[:distillery][:created_at]
    })
    distillery.save
    redirect_to '/distilleries/#{distillery.id}'
  end

  def destroy
    Distillery.destroy(params[:id])
    redirect_to '/distilleries'
  end
end
