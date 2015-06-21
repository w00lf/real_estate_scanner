module Paginatable
  def paginate(collection)
    collection.page(params[:page]).per(params[:per_page])
  end
end