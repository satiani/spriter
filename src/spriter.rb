require 'hpricot'

doc = open("../site/index.html") { |f| Hpricot(f) }

doc.search("img").each { |img|

  attr_class = img.attributes['src']
  attr_class.gsub!(/[^a-zA-Z0-9]/, "_")

  img.swap("<div class=\"#{attr_class}\"/>")  

}

puts doc
