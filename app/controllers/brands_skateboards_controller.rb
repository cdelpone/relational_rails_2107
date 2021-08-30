class BrandsSkateboardsController < ApplicationController
  def index

    @brand = Brand.find(params[:b_id])
    @skateboards =
      if params[:order] = "alpha"
        @brand.skateboards.order(:board_name)
      else
        @brand.skateboards
      end
  end
end
