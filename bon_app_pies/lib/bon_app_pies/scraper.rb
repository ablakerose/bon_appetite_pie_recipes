class Scraper
  
  # BON_APPETITE_PIE_URL = "https://www.bonappetit.com"
  
  def self.scrape_bon_app_pies
    html = open('https://www.bonappetit.com/recipes/desserts/slideshow/pie-recipes')
    
    doc = Nokogiri::HTML(html)
    
    doc.css(".external-link")[7..42].each do |pie_doc|
      title = pie_doc.text.strip
      url = pie_doc.attr("href").strip
      Pie.new(title, url)
    end
  end
  
  def self.scrape_pie_details(pie)
    html = open(pie.url)
    doc = Nokogiri::HTML(html)
    pie.description = doc.css(".dek--basically").text
    # pie.ingredients = doc.css(".ingredient").text
    # pie.ingredients = doc.css(".ingredients__group li").text
    pie.ingredients = doc.css(".ingredients__group li").map.with_index(1) {|ingredient, i| puts "#{i}.#{ingredient} + '\n'"}
    pie.directions = doc.css(".steps li").text
    #both pie.ingredients and pie.directions are arrays. I want to know how i can iterate over them to ensure that each new element of the array begins on a new line
    binding.pry
  end
  
  # def self.ingredients_as_list
  #   pie.ingredients.each.with_index(1) do |ingredient, i|
  #     puts "#{i}. #{ingredient}" 
  #   end
  # end
    
  
end