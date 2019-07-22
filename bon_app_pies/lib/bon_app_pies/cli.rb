class CLI

  def run
    welcome

    Scraper.scrape_bon_app_pies

    print_all_pies
    menu
    end

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
    puts "\n"
    puts "TYPE THE NUMBER OF A PIE TO GET COOKIN'!".red
    puts "Or, type 'list' at any time to see the list of pies again.".red
    puts "Or, type 'exit' at any time to leave the program.".red

    input = gets.chomp

    if input == "exit"
      exit
    elsif input == "list"
      print_all_pies
    elsif input.to_i > 0 && input.to_i <= Pie.all.size
      pie = Pie.all[input.to_i - 1]
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
    #instead of prmpting for menu again, user should have option to go back to the list or exit. User selecting going back to the list... create a method called #print_pie_list
  end

  def ingredients_list
    pie.ingredients.map.with_index(1) {|ingredient_list, i| puts "{#i}  {#ingredient_list}"}
  end

  # #move everything from 35 to 42 to be its own method. If user makes a valid input, pass that input to my #print_pie_details method. #print_pie_details method will have to check if those details have been scraped or not. If someone selects same pie, don't scrape again, print the details that have already been added to that pie instance. (Use a simple conditional to see if those details exist or not)

    def print_all_pies
      Pie.all.each.with_index(1) do |pie, i|
      puts "#{i}. #{pie.title}"
  #move this into its own method, so i can call it in run and also call it in case the user needs to run it again. This is just moving the logic that prints the actual names. If they select list, then I would call the #print_all_pies method again. GOing to have to update my menu to include a conditional if the user enters list.
  end

end
