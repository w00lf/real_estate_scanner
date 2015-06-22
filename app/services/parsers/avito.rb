class Parsers::Avito < Parsers::Base
  URI_TO_PARSE='https://www.avito.ru/moskva/kvartiry/prodam/1-komnatnye'
  PAGE_ATTR = 'p'


  def initialize()
    @agent = Mechanize.new
  end
  
  def parse_catalog_page(page_number = 1)
    page = @agent.get("#{URI_TO_PARSE}?#{PAGE_ATTR}=#{page_number}")
    result = []
    page.search(".catalog-list .item").each do |item|
      attrs = {}
      flat = attrs[:flat_attributes] = {}
      flat[:price] = parse_price(item)
      flat[:address] = get_cleaned_text(item, '.address')
      attrs[:metro] = get_chld_cleaned_text(item, '.address', 4)
      flat[:square] = parse_square(item)
      floors_data = parse_floors(item)
      flat[:house_floors] = floors_data[:total]
      flat[:floor] = floors_data[:floor]
      flat[:source_inner_id] = item.attributes["id"].value
      result << attrs
    end
    result
  end

  def parse_square(item)
    text = get_cleaned_text(item, '.title')
    return 0 unless text
    text.split(',')[1].strip.match(/(\d+)/)[1].to_i
  end

  def parse_floors(item)
    result = {}
    text = get_cleaned_text(item, '.title')
    return result unless text
    result[:floor], result[:total] = text.split(',')[2].
                                        strip.
                                        split('/').
                                        map {|n| 
                                          n.match(/(\d+)/)[1].to_i
                                        }
    result
  end

  def parse_price(item)
    text = get_cleaned_text(item, '.about')
    return unless text
    matched = text.gsub(/[[:space:]]/, '').match(/\d+/)
    return unless matched
    matched[0].to_i
  end
end