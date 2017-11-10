@options = ["1: mv", "2: cp", "3: mkdir", "4: ls", "5: rm"]

def main_menu
  puts "---MAN PAGE LOOKUP---"
  puts "1) Look up Man Page via list"
  puts "2) Look up Man Page via search"
  puts "3) Exit"
  puts "Selection: "
  selection = gets.chomp
  selection.to_i
end


def list
  puts "---LIST---"
  puts @options.join("\n")
  puts "Selection: "
  selection = gets.strip.to_i
  case selection
    when 1
      puts `man mv`
    when 2
      puts `man cp`
    when 3
      puts `man mkdir`
    when 4
      puts `man ls`
    when 5
      puts `man rm`
    else
      puts "Invalid selection my dude"
      list
  end
end

def search
  puts "---SEARCH---"
  puts "Enter your search term: "
  term = gets.strip
  puts "Search/View Man Page for #{term}?"
  answer = gets.strip
  case answer
    when "YES", "yes", "Yes", "Y", "y"
      puts "OK"
      puts `man #{term}`
    else
      puts "Or not..."
  end
end

while true
  case main_menu
    when 1
      list
    when 2
      search
    when 3
      puts "Goodbye."
      exit
    else
      puts "Not a valid option friendo, try again"
      main_menu
  end
end
