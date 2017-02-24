class User < ApplicationRecord
	has_secure_password

	validates :login, uniqueness: true
	validates :login, :name, presence: true

  def self.from_token_request(request)
    find_by(login: request.params["auth"]["login"]) if request.params["auth"]
  end
end
