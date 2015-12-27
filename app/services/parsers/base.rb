class Parsers::Base
  def get_cleaned_text(search_node, match)
    node = search_node.search(match).last
    return unless node
    clean_text(node.text)
  end

  def get_text_from_children(search_node, match)
    text = search_node.
            search(match).
            children.
            find_all {|n| 
              n.class == Nokogiri::XML::Text 
            }.
            map(&:text).
            join(" ")
    return unless text
    clean_text(text)
  end

  def clean_text(text)
    res = text.gsub("\n", '')
    return unless res
    res.strip
  end
end