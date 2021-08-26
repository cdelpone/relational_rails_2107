class BrandsSkateboardsController < ApplicationController
  def index
    @brand = Brand.find(params[:id])
    @skateboards = @brand.skateboards
  end
end
