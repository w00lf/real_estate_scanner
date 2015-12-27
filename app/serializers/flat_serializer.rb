class FlatSerializer < ActiveModel::Serializer
  attributes  :id,
              :square,
              :house_floors,
              :floor,
              :price,
              :address,
              :created_at,
              :updated_at
  has_one :source
end
