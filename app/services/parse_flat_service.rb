class ParseFlatService
  def call(source)
    parser = source.parser.constantize.new
    parser.parse.each do |attrs|
      begin
        flat = Flat.where(source_inner_id: attrs[:flat_attributes][:source_inner_id]).
                    first_or_initialize(attrs[:flat_attributes])
        flat.source = source
        flat.save!            
      rescue => e
        p "Cannot create entry, reason: #{e.message}"
        p "Backtrace: #{e.backtrace.slice(0..20).join("\n")}"
        p "attrs: #{attrs}"
      end
    end
  end
end