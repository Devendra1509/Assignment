require_relative 'grocery_store'
require_relative 'Product'
store = GroceryStore.new

loop do
  puts "\nMain Menu:"
  puts "1. Owner"
  puts "2. User"
  puts "3. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    store.owner_menu
  when 2
    store.user_menu
  when 3
    break
  else
    puts "Invalid choice, please try again."
  end
end

puts "Thank you for using the Grocery store! don't come again here .."
