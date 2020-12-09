class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    false
  end

  def rooms_from_category(category)
    bedrooms = @rooms.find_all do |room|
      if room.category == category
        room
      end
    end
  end

  def area
    @rooms.map do |room|
      room.area
    end
  end
end
