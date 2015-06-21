class Source < ActiveRecord::Base
  validates :title, :url, :parser, presence: true, uniqueness: true
end
