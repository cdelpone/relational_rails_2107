class Distillery < ApplicationRecord

  validates_presence_of :name, :established
  validates_inclusion_of :scotland_location, :in => [true, false]

  has_many :scotches

  def self.order_by_creation
    self.all.order(created_at: :desc)
    # class method - calling on multiple
  end

  def count_scotches
    scotches.count
    # calling this method on an instance of a distillery
  end

  def sort_alpha
    scotches.order(:name)
  end

  def greater_than(num)
    scotches.where("year > #{num}")
  end
end
