FactoryGirl.define do
  factory :source do
    title 'Title'
    url  'http://example.local'
    active true
    parser 'Parsers::Avito'
  end
end