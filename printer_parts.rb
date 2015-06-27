require_relative "part.rb"
class Printer_parts < Part
  attr_accessor :color, :page_per_min, :scanner

  def initialize(part_category, name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, color, page_per_min, scanner)
    @color = color
    @page_per_min = page_per_min.to_i
    @scanner = scanner
    super(name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, part_category)
  end
  def sell_it
    if @quantity_in_stock > 0
      @quantity_in_stock == @quantity_in_stock -= 1
      @quantity_sold == @quantity_sold += 1
    end

  end
  def to_s
    return super + "the color print option is set to #{@color}, the scanner option is set to  #{@scanner} printing #{@page_per_min } pages per minute\n"
  end

  def to_tab
    return super + "#{@color}\t#{@page_per_min}\t#{@scanner}\n"
  end

  def detail
    return super + "Prints Color: #{@color}\nPages per minute: #{@page_per_min}\nScanner Option: #{@scanner}\n\n"
  end
end

