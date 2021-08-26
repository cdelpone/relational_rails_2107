class Brand < ApplicationRecord
  has_many :skateboards

  def self.order_by_creation
    self.all.order(created_at: :desc )
  end

  def num_of_skateboards
    skateboards.count
  end
end
