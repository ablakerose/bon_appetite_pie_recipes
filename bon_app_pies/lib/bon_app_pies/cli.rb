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
    selection
  end

  def selection
    puts "\nWhat would you like to do?"
    input = gets.strip.downcase
    check_selection(input)
  end

  def check_selection(input)
    if input == "exit"
      exit
    elsif input == "list"
      print_all_pies
    elsif input.to_i > 0 && input.to_i <= Pie.all.size
      pie_selection(input)
    else
      puts "Invalid choice...please select again!"
    end
    menu
  end

  def pie_selection(input)
    pie = Pie.all[input.to_i - 1]
    Scraper.scrape_pie_details(pie)
    puts "\n \n"
    puts "\n #{pie.title}".upcase.green
    puts "\n \n * P I E   D E S C R I P T I O N * \n".light_blue + "\n #{pie.description} \n \n"
    puts "\n * L I S T  O F  I N G R E D I E N T S * \n".light_blue
    print_items(pie.ingredients)
    puts "\n * D I R E C T I O N S * ".light_blue
    print_directions(pie.directions)
    puts "\n \n"
  end

  def print_items(list_items)
    list_items.map.with_index {|item| puts "#{item}"}
  end

  def print_directions(directions_list)
    directions_list.map.with_index(1) {|paragraph, i| puts "\n #{i}. #{paragraph} \n"}
  end

  def print_all_pies
    Pie.all.each.with_index(1) do |pie, i|
    puts "#{i}. #{pie.title}"
  end

end
