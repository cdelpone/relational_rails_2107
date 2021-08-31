class Brand < ApplicationRecord
  has_many :skateboards

  def self.order_by_creation
    self.all.order(created_at: :desc )
  end

  def num_of_skateboards
    skateboards.count
  end

  def alphabetize_boards
    skateboards.order(:board_name)
  end

  def over_20
    skateboards.where("cost > 20.0")
  end
end
