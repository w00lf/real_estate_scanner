namespace :graphql do
  desc "Regenerate schema for graphql"
  task schema_regenerate: :environment do
    directory = Rails.root.join('frontend/data/').to_s
    FileUtils.mkdir(directory) unless File.directory?(directory)
    File.open("#{directory}schema.json", 'w') do |f|
      f.write(OfferSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY).to_json)
    end
  end
end
