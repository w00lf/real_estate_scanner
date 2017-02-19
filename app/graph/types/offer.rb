module Types
  Offer = GraphQL::ObjectType.define do
    name "Offer"
    description "A offer entry"

    interfaces [GraphQL::Relay::Node.interface]
    global_id_field :id

    field :price, types.String
    field :flat do
      type Types::Flat
      resolve -> (obj, args, ctx) {
        obj.flat
      }
    end
  end
end
