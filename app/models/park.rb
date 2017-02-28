class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
