class Scraper

  def self.scrape_bon_app_pies
    html = open('https://www.bonappetit.com/recipes/desserts/slideshow/pie-recipes')

    doc = Nokogiri::HTML(html)

    doc.css(".external-link")[7..42].each do |pie_doc|
      title = pie_doc.text.gsub("BA's Best ", "").strip
      url = pie_doc.attr("href").strip
      Pie.new(title, url)
    end
  end

  def self.scrape_pie_details(pie)
    html = open(pie.url)
    doc = Nokogiri::HTML(html)
    pie.description = doc.css(".dek--basically").text
    pie.ingredients = doc.css(".ingredient").map {|ingredient| ingredient.text}
    pie.directions = doc.css(".steps li").map {|paragraph| paragraph.text}

  end

end
