class BrandsController < ApplicationController
  def index
    @brands = Brand.order_by_creation
  end

  def show
    # require "pry"; binding.pry
    @brand = Brand.find(params[:id])
  end

  def edit
    @brand = Brand.find(params[:id])
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

  def update
    brand = Brand.find(params[:id])

    brand.update({
      brand_name: params[:brand][:brand_name],
      established: params[:brand][:established],
      gnarly: params[:brand][:gnarly]
      })

    brand.save

    redirect_to "/brands/#{brand.id}"
  end

  def destroy
    Brand.destroy(params[:id])
    redirect_to '/brands'
  end
end
