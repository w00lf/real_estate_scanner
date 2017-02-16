class Source < ActiveRecord::Base
  has_many :offers, dependent: :destroy
  validates :title, :url, :parser, presence: true, uniqueness: true
end
