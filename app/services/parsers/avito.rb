class Parsers::Avito < Parsers::Base
  URI_TO_PARSE='https://www.avito.ru/moskva/kvartiry/prodam/1-komnatnye'
  PAGE_ATTR = 'p'

  def parse_page_create_flats(base_url)
    page = agent.get(URI.join(base_url, URI_TO_PARSE))
    page.search(".catalog-list item") do |item|
      attrs = {}
      attrs[:price] = item.search(".about").text()
      attrs[:address] = item.search(".address").text()
      Flat.create(attrs)
    end
  end
end