OfferSchema = GraphQL::Schema.define do
  id_from_object ->(object, type_definition, query_ctx) {
    object.api_key.id
  }

  object_from_id ->(id, query_ctx) {
    ApiKey.find(id).owner
  }
  resolve_type ->(obj, ctx) {      
    "Types::#{obj.class.to_s}".constantize
  }
  query Types::Query
end
