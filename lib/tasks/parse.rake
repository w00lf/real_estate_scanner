namespace :parse do
  desc "Parse all sources and create flats"
  task :all, [:timeout] => [:environment] do |t, args|
    timeout = (args[:timeout] || 2).to_i
    Source.find_each do |source|
      parser = source.parser.constantize.new
      begin
        i = 1
        loop do
          batch_attrs = parser.parse_catalog_page(i)
          batch_attrs.each do |attrs|
            begin
              flat = Flat.where(source_inner_id: attrs[:flat_attributes][:source_inner_id]).
                          first_or_initialize(attrs[:flat_attributes])
              # metro =  MetroStation.where(title: attrs[:metro]).
              #             first_or_create(title: attrs[:metro])            
              # flat.metro_station = metro
              flat.source = source
              raise unless flat.save!            
            rescue => e
              p "Cannot create entry, reason: #{e.message}"
              p "Backtrace: #{e.backtrace.slice(0..20).join("\n")}"
              p "attrs: #{attrs}"
            end
          end
          i += 1 
          break if i > 2 
          sleep timeout
        end
      rescue Net::HTTPNotFound => e
        p "Completed parse for #{source.title}"
        next
      end
    end
  end
end
