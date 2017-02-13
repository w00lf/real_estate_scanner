#graph/types/author_type.rb
FlatType = GraphQL::ObjectType.define do
  name 'Flat'
  description 'Flat for offer'
  field :address, types.String  
end
