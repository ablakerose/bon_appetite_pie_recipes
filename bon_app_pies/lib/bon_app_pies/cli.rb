class CLI 
  
  def run
    welcome
    
    Scraper.scrape_bon_app_pies
    
    Pie.all.each.with_index(1) do |pie, i|
      puts "#{i}. #{pie.title}"
    
    end
    menu
  end
  
  def welcome
    puts "\n T I M E  T O  M A K E  A  P I E!"
    
    puts '            (                 '.light_blue
    puts '              )               '.light_blue
    puts '         __..---..__          '.light_blue
    puts "     ,-='  /  |  \  `=-.      ".light_blue
    puts '    :--..___________..--;     '.light_blue
    puts '     \.,_____________,./      '.light_blue
    puts "\n \n"  
  end
  
  def menu
    puts "CHOOSE A PIE TO GET COOKIN'!".red
    
    input = gets.chomp
    
    pie = Pie.all[input.to_i - 1]
    if pie 
      Scraper.scrape_pie_details(pie)
      puts "\n \n"
      puts "\n #{pie.title}".upcase.green
      puts "\n \n * P I E   D E S C R I P T I O N * \n".light_blue + "#{pie.description} \n \n"
      puts "\n * L I S T  O F  I N G R E D I E N T S * \n".light_blue + "#{pie.ingredients}\n"
      puts "\n * D I R E C T I O N S * \n".light_blue + "#{pie.directions}\n"
      puts "\n \n"
    else
      puts "Invalid choice...please select again!"
    end
    menu
  end
  
   
  
  
end

