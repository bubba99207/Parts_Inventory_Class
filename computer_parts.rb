require_relative "part.rb"
class Computer_parts < Part
  attr_accessor :mb_of_r, :hard_drive_capacity, :processor_speed

  def initialize(part_category, name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, mb_of_r, hard_drive_capacity, processor_speed)
    @mb_of_r = mb_of_r.to_i
    @hard_drive_capacity = hard_drive_capacity.to_i
    @processor_speed = processor_speed
    super(name, retail_price, cost, quantity_in_stock, quantity_sold, detail_description, part_category,)
  end



  def sell_it
    if @quantity_in_stock > 0
      @quantity_in_stock == @quantity_in_stock -= 1
      @quantity_sold == @quantity_sold += 1
    end
  end
  def to_s
    return super + " having #{@mb_of_r } MB of Ram a Processor Speed of #{@processor_speed } and a Hard Drive capacity of  #{@hard_drive_capacity}\n "
  end
  def to_tab
    return super + "#{@mb_of_r}\t#{@hard_drive_capacity}\t#{@processor_speed}\n"
  end
def detail
  return super + "Ram: #{@mb_of_r}\nProcessor Speed: #{@processor_speed}\nHard Drive Capacity: #{@hard_drive_capacity}\n\n"
end
end
