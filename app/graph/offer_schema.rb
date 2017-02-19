OfferSchema = GraphQL::Schema.define do
  # Create UUIDs by joining the type name & ID, then base64-encoding it
  id_from_object ->(object, type_definition, query_ctx) {
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  }

  object_from_id ->(id, query_ctx) {
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.constantize.find(item_id)
  }
  resolve_type ->(obj, ctx) {    
    return OfferObjType if obj.is_a?(OfferType)
    "#{obj.class.to_s}Type".constantize
  }
  query QueryType
end
