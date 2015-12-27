class FlatsIndex < Chewy::Index
  define_type Flat do
    field :address, :source_id
    field :price, :square, :house_floors, :floor, type: 'integer'
    field :added, type: 'date', value: ->{ added_at } # value proc for source object context
    field :created, type: 'date', value: ->{ created_at } # value proc for source object context
  end
end