module Types
  QuerySources = GraphQL::ObjectType.define do
    name 'QuerySources'
    description 'root for sources'

    field :sources, Types::Source.to_list_type
  end
end
