class Parsers::Avito < Parsers::Base
  URI_TO_PARSE='https://www.avito.ru/moskva/kvartiry/prodam/1-komnatnye'
  PAGE_ATTR = 'p'
  TIMEOUT = 2

  def initialize()
    @agent = Mechanize.new
  end
  
  def parse
    Enumerator.new do |y|
      page_number = 1
      loop do
        begin 
          page = @agent.get("#{URI_TO_PARSE}?#{PAGE_ATTR}=#{page_number}")
          
          serialize_attributes(page).each do |entry|
            y.yield(entry)
          end
          page_number += 1
          sleep TIMEOUT
        rescue Net::HTTPNotFound, Mechanize::ResponseCodeError => e 
          break
        end
      end
    end
  end

  private

  def serialize_attributes(page)
    page.search(".catalog-list .item").map do |item|
      attrs = {}
      flat = attrs[:flat_attributes] = {}
      flat[:price] = parse_price(item)
      flat[:address] = get_text_from_children(item, '.address')
      flat[:square] = parse_square(item)
      floors_data = parse_floors(item)
      flat[:house_floors] = floors_data[:total]
      flat[:floor] = floors_data[:floor]
      flat[:source_inner_id] = item.attributes["id"].value
      flat[:metro_station_id] = parse_metro(item)
      flat[:added_at] = parse_added_at(item)
      attrs
    end
  end

  def parse_added_at(item)
    russian_month = {
      "января" => "1", 
      "февраля" => "2", 
      "мара" => "3", 
      "апреля" => "4", 
      "мая" => "5", 
      "июня" => "6", 
      "июля" => "7", 
      "августа" => "8", 
      "сентября" => "9", 
      "октября" => "10", 
      "ноября" => "11", 
      "декабря" => "12", 
      "Сегодня" => Time.current.strftime('%d %m'),
      "Вчера" => (Time.current - 1.days).strftime('%d %m')
    }
    added_date_text = get_cleaned_text(item.children.search('.description'), '.date')
    russian_month.each do |name, number|
      added_date_text.gsub!(name, number)
    end
    Time.strptime(added_date_text, '%d %m %H:%M').in_time_zone
  end

  def parse_metro(item)
    address = item.children.search('.description p.address').first
    return unless address
    line = (address.children.search('i').last.attributes["title"].value rescue nil)
    metro_line = MetroLine.where(title: line).first_or_create
    address_text = get_cleaned_text(item, '.address')
    if address_text.blank? || address_text.split(',').length == 1
      puts "Cannot find address text in #{address.text}"
    end
    match_text = address_text.split(',').first
    match_regex = /(.+)?\s\d+.?(\d+)?\+?\s(м|км)/
    metro_station_title = (match_text.match(match_regex).try(:[], 1) || match_text)
    
    puts "For #{match_text} finded:\n"
    puts("\t#{metro_station_title}\n\n")
    return unless metro_station_title
    metro_line.metro_stations.where(title: metro_station_title).first_or_create.id
  end

  def parse_square(item)
    text = get_cleaned_text(item, '.title')
    return 0 unless text && text.split(',')[1]
    text.split(',')[1].strip.match(/(\d+)/)[1].to_i
  end

  def parse_floors(item)
    result = {}
    text = get_cleaned_text(item, '.title')
    return result unless text && text.split(',')[2]
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