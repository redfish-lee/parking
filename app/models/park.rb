class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def overlap?
    Park.where(floor: self.floor, number: self.number).exists?
  end
end
