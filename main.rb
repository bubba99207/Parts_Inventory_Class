# Main Class
require_relative "computer_parts.rb"
require_relative "tablet_parts.rb"
require_relative "printer_parts.rb"
require_relative "part.rb"
require_relative "menu.rb"
require_relative "inventory.rb"
menu = Menu.new(
    "List all parts",
    "Sell a part",
    "Add a new part",
    "Remove a part",
    "Update a part",
    "Show detailed info",
    "Show total inventory",
    "quit"
)


#name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, category, screen_size, mb_of_ram, sd, comp_mb_of_ram, hdc, pros_speed


inventory = Inventory.new

inventory_file = File.open('parts_database.tsv', 'r')
while !inventory_file.eof? do
  part = inventory_file.gets.chomp.split(/\t/)

  if part[0] == "Tablet"
    newPart = Tablet_Parts.new(part[0], part[1], part[2], part[3], part[4], part[5], part[6], part[7], part[8.to_i], part[9])
    inventory.add_part(newPart)
  end
  if part[0] == "Computer"
    newPart = Computer_parts.new(part[0], part[1], part[2], part[3], part[4], part[5], part[6], part[7], part[8], part[9])
    inventory.add_part(newPart)
  end

  if part[0] == "Printer"
    newPart = Printer_parts.new(part[0], part[1], part[2], part[3], part[4], part[5], part[6], part[7], part[8.to_i], part[9])
    inventory.add_part(newPart)
  end
end

inventory_file.close
while ((choice = menu.get_menu_choice) != menu.quit)
  #Open mores code file and split it into a mores code hash

  case choice
    when 1 #List Parts
      puts inventory.list_parts

    when 2 #Buy Part
      puts inventory.list_parts
      puts "What would you like to Buy?"
      choice = gets.to_i
      inventory.sell_part(choice -1)
    when 3
      puts " Choose a category
         1. tablet
         2. printer
         3. computer"
      entry = gets.to_i
      if entry == 1
        entry = "Tablet"
      elsif entry == 2
        entry = "Printer"
      elsif entry == 3
        entry = "Computer"
      end
      part_cat = entry
      category = entry

      if part_cat == "Tablet"
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp

        puts "Enter a screen size!"
        screen_size =gets.to_i
        puts "Enter the amount of Ram!"
        mb_of_ram = gets.to_i
        puts "is there an S.D slot?
        1. Yes
        2. No"
        entry = gets.to_i
        if entry == 1
          sd = "yes"
        else
          sd = "No"
        end
        part= Tablet_Parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, screen_size, mb_of_ram, sd)
        inventory.add_part(part)


      end
      if part_cat == "Printer"
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp


        puts "Does it print color
        1.  Yes
        2.  No"
        entry = gets.chomp
        if entry == 1
          color = "yes"
        else
          color = "no"
        end
        puts "Enter Pages per minute"
        ppm = gets.to_i
        puts "is there a scanner?
        1. Yes
        2. No"
        entry = gets.to_i
        if entry == 1
          scanner = "yes"
        else
          scanner = "No"
        end

        prod_name = Printer_parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, color, ppm, scanner)
        inventory.add_part(prod_name)

      end
      if part_cat == "Computer"
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp

        puts "Enter MB of Ram"
        comp_mb_of_ram = gets.to_i
        puts "Enter the Hard Drive capacity"
        hdc = gets.to_i
        puts "Enter Processor speed"
        pros_speed = gets.to_i

        prod_name = Computer_parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, comp_mb_of_ram, hdc, pros_speed)
        inventory.add_part(prod_name)

      end

      puts
    when 4
      puts inventory.list_parts
      puts "Choose a product to remove!"
      choice = gets.to_i
      inventory.remove_part(choice)

    when 5 #update                      ################UPDATE################
      puts inventory.list_parts
      puts "Choose a part to update"
      choice = gets.to_i
      num = choice-1
      if inventory.get_cat(num) == "Tablet"
        category = inventory.get_cat(num)
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp
        puts "Enter a screen size!"
        screen_size =gets.to_i
        puts "Enter the amount of Ram!"
        mb_of_ram = gets.to_i
        puts "is there an S.D slot?
        1. Yes
        2. No"
        entry = gets.to_i
        if entry == 1
          sd = "yes"
        else
          sd = "No"
        end
       part = Tablet_Parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, screen_size, mb_of_ram, sd)
        inventory.update_part(num, part)
      end

      if inventory.get_cat(num) == "Computer"
        category = "Computer"
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp

        puts "Enter MB of Ram"
        comp_mb_of_ram = gets.to_i
        puts "Enter the Hard Drive capacity"
        hdc = gets.to_i
        puts "Enter Processor speed"
        pros_speed = gets.to_i

        part = Computer_parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, comp_mb_of_ram, hdc, pros_speed)
        inventory.update_part(num, part)
      end
      if inventory.get_cat(num) == "Printer"
        category = "Printer"
        puts "Enter part name!"
        part_name = gets.chomp
        puts "Enter retail price!"
        retail_price = gets.to_f
        puts "Enter wholesale cost!"
        wholesale_cost = gets.to_f
        puts "Enter Quantity in stock!"
        qty_in_stock = gets.to_i
        puts "Enter the Quantity sold!"
        qty_sold = gets.to_i
        puts "Enter a description of the product!"
        description = gets.chomp

        puts "Enter MB of Ram"
        comp_mb_of_ram = gets.to_i
        puts "Enter the Hard Drive capacity"
        hdc = gets.to_i
        puts "Enter Processor speed"
        pros_speed = gets.to_i

        part = Computer_parts.new(category, part_name, retail_price, wholesale_cost, qty_in_stock, qty_sold, description, comp_mb_of_ram, hdc, pros_speed)
        inventory.update_part(num, part)
      end


    when 6
      puts inventory.list_parts
      puts "Choose Part!"
      choice = gets.to_i
      num = choice-1
      puts inventory.show_details(num)

    when 7
          puts inventory.total_inventory
    when 8

  end

end

save_file = File.open("parts_database.tsv", "w")
save_file.puts "Part_Category	Name	Retail_Price	Cost	Qty_In_Stock	Qty_Sold	Detail_Description	XXX	YYY	ZZZ"
save_file.puts "#{inventory.to_tab}"
save_file.close()

