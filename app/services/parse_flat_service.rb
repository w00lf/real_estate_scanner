class ParseFlatService
  def initialize(requester:, parser:, source:)
    log_file = Rails.root.join('log', "import_logger_#{source.title}_#{Time.now.strftime('%d_%m_%Y__%H_%M')}.log")
    @requester = requester
    @logger = Logger.new(File.new(log_file, 'w+'))
    @source = source
    @parser = parser
  end

  def call    
    @requester.call.each do |page|
      @parser.call(page).each do |attrs|
        begin
          flat = Flat.where(source_inner_id: attrs[:flat_attributes][:source_inner_id]).
                      first_or_initialize(attrs[:flat_attributes])
          flat.source = @source
          flat.save!            
        rescue => e
          @logger.error('#' * 100)
          @logger.error("Cannot create entry, reason: #{e.message}")
          @logger.error("Backtrace: #{e.backtrace.slice(0..20).join("\n")}")
          @logger.error("attrs: #{attrs}")
        end
      end
    end
  end
end