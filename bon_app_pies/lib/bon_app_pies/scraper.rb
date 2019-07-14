class Scraper
  
  # BON_APPETITE_PIE_URL = "https://www.bonappetit.com"
  
  def self.scrape_bon_app_pies
    html = open('https://www.bonappetit.com/recipes/desserts/slideshow/pie-recipes')
    
    doc = Nokogiri::HTML(html)
    
    doc.css(".external-link")[7..42].each do |pie_doc|
      title = pie_doc.text
      url = pie_doc.attr("href")
      Pie.new(title, url)
    end
  end
  
  def self.scrape_pie_details(pie)
    html = open(pie.url)
    doc = Nokogiri::HTML(html)
    binding.pry
    description = doc.css(".dek--basically").text
    ingredients = doc.css(".ingredients__inner").text
  end
end