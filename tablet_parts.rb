require_relative "part.rb"
class Tablet_Parts < Part
  attr_accessor :screen_size, :mb_of_r, :sd_slot

  def initialize(part_category, name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, screen_size, mb_of_r, sd_slot)
    @screen_size = screen_size
    @mb_of_r = mb_of_r
    @sd_slot = sd_slot
    super(name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, part_category)
  end
def sell_it
  if @quantity_in_stock > 0
    @quantity_in_stock == @quantity_in_stock -= 1
    @quantity_sold == @quantity_sold += 1
  end

end
  def to_s
    return super + "having a Screen Size of #{@screen_size}, #{@mb_of_r } MB of Ram and #{@sd_slot } there is a SD Slot\n"
  end

  def to_tab
    return super + "#{@screen_size}\t#{@mb_of_r}\t#{@sd_slot}\n"
  end
  def detail
    return super + "Screen Size: #{@screen_size}\nRam: #{@mb_of_r}\nS.D Slot: #{@sd_slot}\n\n"
  end
end

