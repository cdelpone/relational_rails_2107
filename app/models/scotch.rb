class Scotch < ApplicationRecord
  validates_presence_of :name, :single_malt, :year

  belongs_to :distillery

# if params[:order]
#   chara.order(:name)
# else chars
#   in p/c contrllers
#   if params [:sort]

end
