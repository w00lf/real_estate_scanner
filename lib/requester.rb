class Requester
	DEFAULT_URI_TO_PARSE='https://www.avito.ru/moskva/kvartiry/prodam/1-komnatnye'
	DEFAULT_PAGE_ATTR = 'p'
  DEFAULT_TIMEOUT = 2

	def initialize(agent: Mechanize.new, uri: DEFAULT_URI_TO_PARSE, timeout: DEFAULT_TIMEOUT, page_attr_name: DEFAULT_PAGE_ATTR, start_page: 1)
		@agent = agent
		agent.redirect_ok = false
		@uri = uri
		@timeout = timeout
		@page_attr_name = page_attr_name
		@start_page = start_page
	end
	
	def call
		Enumerator.new do |y|
      page_number = @start_page
      loop do
        begin 
          page = @agent.get("#{@uri}?#{@page_attr_name}=#{page_number}")                    
          break if page.code == '302'
          y.yield(page)          
          page_number += 1
          sleep @timeout
        rescue Net::HTTPNotFound, Mechanize::ResponseCodeError => e 
          break
        end
      end
    end
	end
end