namespace :parse do
  desc "Parse all sources and create flats"
  task all: :environment do
    ParseAllFlatSourcesService.call
  end
end
