module Types
  Source = GraphQL::ObjectType.define do
    name 'Source'
    description 'Source for offers'

    interfaces [GraphQL::Relay::Node.interface]
    global_id_field :id
    
    field :title, types.String
    field :url, types.String

    connection :offers, Types::Offer.connection_type do
      resolve ->(obj, args, ctx) {
        obj.offers
      }
    end

    field :nodes, GraphQL::Relay::Node.plural_field
  end
end
