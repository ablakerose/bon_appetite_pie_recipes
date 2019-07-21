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
    
    ingredient_list = doc.css(".ingredients__text").text.each do |ingredient_list|
      ingredients = ingredient_list.text
    end
      
    pie.ingredients = doc.css(".ingredients__group li").map.with_index(1) {|ingredient, i| puts "#{i}.#{ingredient} + '\n'"}
    #pie.ingredients = doc.css("ingredient selector").map {|ingredient| ingredient.text}
    #I want pie.ingredients = doc.css.ingredient.text
    #probably something wrong with CSS selector. The way it's written, "ingredient" would represent an entire object. Ingredient.text 
    #anything that does a puts, I have to move to CLI. 
    #change my scraper so that my pie.ingredients is an array of ingredients and then in CLI, I can say pie.ingredients.map and print each one of those ingredients. 
    #pie.directions = doc.css(".steps li").text
    #iterate over the return of doc.css(".steps li") iterate over them and grab the text of each individual one and then add those elements to an array. if I want it to properly be an array of each individual step, I have to change line 26. 
    #.doc.css.map do |step| 
     # step.text
      #then when i print that in my CLI class, I would do something like pie.directions.each.with_index and print each individual #steps. 
    
   
    
  end
  
  # def self.ingredients_as_list
  #   pie.ingredients.each.with_index(1) do |ingredient, i|
  #     puts "#{i}. #{ingredient}" 
  #   end
  # end
    
  
end