# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Source.create(
  title: 'avito.ru',
  url: "http://avito.ru/",
  parser: "Parsers::Avito"
)

OFFER_TYPES = %w(rent buy).freeze
OFFER_TYPES.each do |type|
	OfferType.create(title: type)
end
