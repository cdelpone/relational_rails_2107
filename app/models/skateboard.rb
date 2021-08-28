class Skateboard < ApplicationRecord
  belongs_to :brand

  def self.nose_filter
    self.where("nose = true")
  end
end
