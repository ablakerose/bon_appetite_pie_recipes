class CLI 
  def run

    puts 'the cli is running!'
    
    Scraper.scrape_bon_app_pies
    
    Pie.all.each.with_index(1) do |pie, i|
      puts "#{i}. #{pie.title}" 
    end
    
  end
end

