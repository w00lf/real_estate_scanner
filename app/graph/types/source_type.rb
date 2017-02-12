#graph/types/author_type.rb
SourceType = GraphQL::ObjectType.define do
  name 'Source'
  description 'Source for offers'
  field :title, types.String
  field :url, types.String
end
