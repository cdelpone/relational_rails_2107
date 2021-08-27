class Distillery < ApplicationRecord
  has_many :scotches

  def self.order_by_creation
    self.all.order(created_at: :desc )
    # class method - calling on multiple
  end

  def count_scotches
    scotches.count
    # calling this method on an instance of a distillery
  end
end
