class BrandsSkateboardsController < ApplicationController
  def index
    # require "pry"; binding.pry
    @brand = Brand.find(params[:b_id])
    @skateboards = @brand.skateboards
  end
end
