class Distillery < ApplicationRecord

  validates_presence_of :name, :established, :scotland_location

  has_many :scotches

  def self.order_by_creation
    self.all.order(created_at: :desc )
    # class method - calling on multiple
  end

  def count_scotches
    scotches.count
    # calling this method on an instance of a distillery
  end

  def sort_alpha
    self.scotches.order(name: :asc)
    # render :action => :index
  end

  # def new_scotch
  #   Scotch.new(:distillery_id => self)
  # end
end
