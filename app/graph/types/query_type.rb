QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :offers do
    type types[!OfferObjType]
    argument :limit, !types.Int
    description "Get offers"
    resolve ->(obj, args, ctx) { Offer.limit(args["limit"]) }
  end

  field :nodes, GraphQL::Relay::Node.plural_field
end
