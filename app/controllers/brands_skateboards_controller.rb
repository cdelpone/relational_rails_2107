class BrandsSkateboardsController < ApplicationController
  def index
    # binding.pry
    @brand = Brand.find(params[:b_id])
  end
end
