class CLI 
  def run

    puts 'Who is ready for pie?!'
    
    puts '            (                 '
    puts '              )               '
    puts '         __..---..__          '
    puts "     ,-='  /  |  \  `=-.      "
    puts '    :--..___________..--;     '
    puts '     \.,_____________,./      '
    puts "\n \n"  
  
    Scraper.scrape_bon_app_pies
    
    Pie.all.each.with_index(1) do |pie, i|
      puts "#{i}. #{pie.title}" 
    end
    menu
  end
  
  def menu
    puts "Please select a pie to view its details:"
    
    input = gets.chomp
    
    pie = Pie.all[input.to_i - 1]
    if pie 
      Scraper.scrape_pie_details(pie)
      puts "\n \n"
      puts "\n Here are the details for #{pie.title}"
      puts "\n \n Pie Description: #{pie.description} \n \n"
      puts "\n List of Ingredients: #{pie.ingredients}\n"
      puts "\n \n"
    else
      puts "Invalid choice...please select again!"
    end
    menu
  end
end

