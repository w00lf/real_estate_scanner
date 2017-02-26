module Types
  Query = GraphQL::ObjectType.define do
    name "Query"
    description "The query root of this schema"

    field :node, GraphQL::Relay::Node.field
    field :source do
      type Types::Source

      # Add an argument:
      argument :id, !types.ID

      resolve ->(obj, args, ctx) {
        ::Source.find_api(args[:id])
      }
    end

    field :sources do
      type Types::QuerySources

      # # Add an argument:
      # argument :id, !types.ID

      resolve ->(obj, args, ctx) {
        Struct.new('QuerySources', :sources).new(::Source.all)
      }
    end
  end
end
