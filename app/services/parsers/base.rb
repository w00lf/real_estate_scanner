class Parsers::Base
  def get_cleaned_text(search_node, match)
    node = search_node.search(match).last
    return unless node
    clean_text(node.text)
  end

  def get_chld_cleaned_text(search_node, match, child_position)
    node = search_node.search(match).children[child_position]
    return unless node
    clean_text(node.text)
  end

  def clean_text(text)
    text.gsub("\n", '').strip
  end
end