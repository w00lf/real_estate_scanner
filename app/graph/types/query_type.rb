QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :node, GraphQL::Relay::Node.field
  
  field :source do
    type SourceType

    # Add an argument:
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      Source.find(args[:id])
    }
  end
end
