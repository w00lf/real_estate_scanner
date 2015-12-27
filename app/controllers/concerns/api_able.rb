module ApiAble
  def response_json_collection(collection, serializer = nil, options = {})
    result = paginate(collection)
    render(options.merge(
      json: result,
      each_serializer: serializer,
      meta: { 
        page: result.current_page,
        per_page: result.size,
        total: result.total_count
      }, 
      meta_key: "info")
    )
  end
end