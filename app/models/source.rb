class Source < ActiveRecord::Base
  has_many :flats, dependent: :destroy
  validates :title, :url, :parser, presence: true, uniqueness: true
end
