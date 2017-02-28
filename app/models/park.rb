class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def overlap?
    where(floor: self.floor, number: self.number).exists?
  end
end
