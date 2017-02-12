#graph/types/blog_type.rb
OfferType = GraphQL::ObjectType.define do
  name "Offer"
  description "A offer entry"
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
