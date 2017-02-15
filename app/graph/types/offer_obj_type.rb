#graph/types/blog_type.rb
OfferObjType = GraphQL::ObjectType.define do
  name "Offer"
  description "A offer entry"

  interfaces [GraphQL::Relay::Node.interface]
  global_id_field :id

  field :price, types.String
  field :source do
    type SourceType
    resolve -> (obj, args, ctx) {
      obj.source
    }
  end
  field :flat do
    type FlatType
    resolve -> (obj, args, ctx) {
      obj.flat
    }
  end
end
