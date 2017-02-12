namespace :parse do
  desc "Test service with first parser"
  task test: :environment do
    require 'requester'
    requester = Requester.new
    parser = Parsers::Avito.new
    ParseOffersService.new(requester: requester, parser: parser, source: Source.first).call
  end
end
