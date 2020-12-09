require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

     house.add_room(room_2)
     house.add_room(room_1)

     assert_equal [room_2, room_1], house.rooms
  end

  def test_a_house_is_above_market_average
    house = House.new("$400000", "123 sugar lane")

    assert_equal false, house.above_market_average?
  end

  def test_it_has_rooms_from_category_bedroom
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  end

  def test_it_has_an_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    total_area = (room_1.area + room_2.area + room_3.area + room_4.area)

    assert_equal 1900, house.area
  end

  def test_it_has_details
    house = House.new("$400000", "123 sugar lane")

    house_details = {"price" => 400000, "address" => "123 sugar lane"}

    assert_equal house_details, house.details
  end
end
