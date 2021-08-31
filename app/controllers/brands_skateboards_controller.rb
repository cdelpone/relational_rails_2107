class BrandsSkateboardsController < ApplicationController
  def index
    @brand = Brand.find(params[:b_id])
    @skateboards = skateboard_order
  end

  private

  def skateboard_order
    if params[:order]
      @brand.alphabetize_boards
    elsif params[:cost_index]
      @brand.over_20
    else
      @brand.skateboards
    end
  end
end
