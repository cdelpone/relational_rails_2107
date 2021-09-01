class Scotch < ApplicationRecord
  validates_presence_of :name, :year
  validates_inclusion_of :single_malt, :in => [true, false]
  belongs_to :distillery
end
