require_relative "computer_parts.rb"
require_relative "tablet_parts.rb"
require_relative "printer_parts.rb"
require_relative "part.rb"
class Inventory
  attr_accessor :stockOnHand, :counter

  def initialize
    @stockOnHand = []
    @counter = counter = 0
  end
def get_cat(num)
  @stockOnHand[num].part_category
end
  def add_part(part)
    @stockOnHand << part
  end

  def sell_part(part)
    @stockOnHand[part].sell_it
  end
def total_inventory
  ret_str = ""
  total_retail = 0
  total_cost = 0
  total_sold = 0
total_profit = 0
 @stockOnHand.each do |part|
   total_retail += part.retail_price
   total_cost += part.cost
   total_sold += part.quantity_sold
 total_profit += part.profit
 ret_str += part.get_profit + "\n"
 end
  return "#{ret_str}\n Totals: Retail Price: #{total_retail} Cost: #{total_cost} Number Sold: #{total_sold } Total Profit: #{total_profit}"
end


  def update_part(num, part)
   @stockOnHand[num] = part
  end

  def remove_part(part)
    @stockOnHand.delete_at(part- 1)
  end

  def list_parts
    ret_str = ""
    @stockOnHand.each.with_index do |part, index|
      ret_str += "#{index+1}. " + "#{part} "+ "\n"
    end
    return ret_str + "\n"
  end
  def to_tab
    ret_str = ""
    @stockOnHand.each do |part|
      ret_str += part.to_tab
    end
    return ret_str + "\n"
  end
  def show_details(num)
    ret_str = ""
   ret_str += @stockOnHand[num].detail

    return ret_str
  end

end


