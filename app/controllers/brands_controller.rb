class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brands.find(params[:id])
  end

  def edit
    @brands.find(params[:id])
  end

  def new
  end

  def create
    brand = Brand.new({
      brand_name: params[:brand][:brand_name],
      established: params[:brand][:established],
      gnarly: params[:brand][:gnarly]
      })

    brand.save
    redirect_to '/brands'
  end
end
