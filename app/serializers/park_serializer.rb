class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :floor, :number, :phone
end
