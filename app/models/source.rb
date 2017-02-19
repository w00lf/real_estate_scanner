class Source < ActiveRecord::Base
	include ModelApiAble

  has_many :offers, dependent: :destroy
  validates :title, :url, :parser, presence: true, uniqueness: true
end
