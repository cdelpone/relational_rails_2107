class Distillery < ApplicationRecord
  has_many :scotches

  def self.order_by_creation
    self.all.order(created_at: :desc )
  end

  def count_scotches
    scotches.count
  end
end
