module Types
	Flat = GraphQL::ObjectType.define do
	  name 'Flat'
	  description 'Flat for offer'

	  interfaces [GraphQL::Relay::Node.interface]
	  global_id_field :id

	  field :address, types.String
	end
end