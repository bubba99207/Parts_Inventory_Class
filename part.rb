class Part
  attr_accessor :name, :retail_price, :cost, :quantity_in_stock, :quantity_sold, :detail_description, :part_category, :profit, :detail

  def initialize(name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, part_category)
    @name = name
    @retail_price = retail_price.to_f
    @cost = cost.to_f
    @quantity_in_stock = quantity_in_stock.to_i
    @quantity_sold = quantity_sold.to_i
    @detail_description = detail_description
    @part_category = part_category
    @profit = (@retail_price - @cost)* @quantity_sold
    @detail = ""
  end

def get_profit
 return "#{@name}\tRetail Price: #{@retail_price} Cost: #{@cost}  Number Sold: #{@quantity_sold}  Profit: #{@profit}"
end
  def to_s
    return "#{@name } is a #{@part_category} part that has a Retail price of #{@retail_price}, a Wholesale cost of #{@cost}\n there are #{@quantity_in_stock } in stock, #{@quantity_sold } have been sold. This part is #{@detail_description}\n "
  end
  def to_tab
    return "#{@part_category}\t#{@name}\t #{@retail_price.to_i}\t#{@cost.to_i}\t #{@quantity_in_stock.to_i}\t #{@quantity_sold.to_i}\t#{@detail_description}\t"
  end
  def detail
    return "Category: #{@part_category}\nName: #{@name}\nRetail Price: #{@retail_price}\nCost: #{@cost}\nQuantity In Stock: #{@quantity_in_stock}\nQuantity Sold: #{@quantity_sold}\ndescription: #{@detail_description}\n"
  end
end

