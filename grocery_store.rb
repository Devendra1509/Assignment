require_relative 'Product'

class GroceryStore
  def initialize
    @products = []
    @next_id = 1
    @cart = []
  end

  def owner_menu
    loop do
      puts "\nOwner Menu:"
      puts "1. Add Product"
      puts "2. View Products"
      puts "3. Update Product"
      puts "4. Delete Product"
      puts "5. Exit"
      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_product
      when 2
        view_products
      when 3
        update_product
      when 4
        delete_product
      when 5
        break
      else
        puts "Invalid choice, please try again."
      end
    end
  end

  def user_menu
    loop do
      puts "\nUser Menu:"
      puts "1. View Products"
      puts "2. Purchase Product"
      puts "3. Exit"
      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        view_products
      when 2
        purchase_product
      when 3
        break
      else
        puts "Invalid choice, please try again."
      end
    end
  end

  private

  def add_product
    print "Enter product name: "
    name = gets.chomp
    print "Enter product price: "
    price = gets.chomp.to_f
    print "Enter product quantity: "
    quantity = gets.chomp.to_i

    product = Product.new(@next_id, name, price, quantity)
    @products << product
    @next_id =@next_id + 1

    puts "Product added successfully!"
  end

  def view_products
   	
        puts "\nProducts List:"
        @products.each { |product| puts product }
 
  end

  def update_product
    print "Enter product ID to update: "
    id = gets.chomp.to_i
    product = @products.find { |p| p.id == id }

    if product
      print "Enter new name (current: #{product.name}): "
      product.name = gets.chomp
      print "Enter new price (current: #{product.price}): "
      product.price = gets.chomp.to_f
      print "Enter new quantity (current: #{product.quantity}): "
      product.quantity = gets.chomp.to_i

      puts "Product updated successfully!"
    else
      puts "Product not found."
    end
  end

  def delete_product
    print "Enter product ID to delete: "
    id = gets.chomp.to_i
    product = @products.find { |p| p.id == id }

    if product
      @products.delete(product)
      puts "Product deleted successfully!"
    else
      puts "Product not found."
    end
  end

  def purchase_product
    loop do
      print "Enter product ID to purchase: "
      id = gets.chomp.to_i
      product = @products.find { |p| p.id == id }

      if product
        print "Enter quantity to purchase: "
        quantity = gets.chomp.to_i

        if quantity <= product.quantity
          product.quantity =product.quantity - quantity
          @cart << { product: product, quantity: quantity }
          puts "Added #{quantity} of #{product.name} to your cart."
        else
          puts "Insufficient quantity in stock."
        end
      else
        puts "Product not found."
      end

      print "Do you want to purchase another product? (yes/no): "
      break if gets.chomp.downcase != 'yes'
    end

    generate_bill
  end

  
end
