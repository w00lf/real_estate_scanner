module ModelApiAble
	extend ActiveSupport::Concern

  included do
    has_one :api_key, as: :owner
    before_create :build_api_key
  end

  module ClassMethods
    def find_api(key)
			joins(:api_key).find_by!(api_keys: { id: key })
		end
  end
end
