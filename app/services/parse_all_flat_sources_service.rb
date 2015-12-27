class ParseAllFlatSourcesService

  def call
    Source.find_each do |source|
      begin 
        ParseFlatSource.call(source)
      rescue => e
        Rails.logger.info("Caanot parse source #{source}, reason: #{e}")
      end
    end
  end
end