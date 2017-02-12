QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :offer do
    type OfferType
    argument :id, !types.ID
    description "Find a Offer by ID"
    resolve ->(obj, args, ctx) { Offer.find(args["id"]) }
  end
end