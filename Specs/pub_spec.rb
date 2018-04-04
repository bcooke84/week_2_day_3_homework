require("minitest/autorun")
require("minitest/rg")

require_relative("../customer.rb")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../food.rb")

class PubTest < MiniTest::Test
  def setup()
    @customer1 = Customer.new("Victor", 25.00, 36, 0)
    @customer2 = Customer.new("John", 10.00, 17, 0)
    @customer3 = Customer.new("Brian", 20.00, 33, 30)
    @drink1 = Drink.new("Beer", 4.00, 4)
    @drink2 = Drink.new("Wine", 5.00, 5)
    @drink3 = Drink.new("Cider", 3.00, 6)
    @drink = [@drink1, @drink2, @drink3]
    @food1 = Food.new("Crisps", 1.00, -2)
    @food2 = Food.new("Sandwich", 5.00, -5)
    @food3 = Food.new("Pizza", 10.00, -10)
    @food = [@food1, @food2, @food3]
    @pub = Pub.new("The Grumpy Git", 100.00, @drink, @food)
  end

  def test_get_pub_name()
    assert_equal("The Grumpy Git", @pub.name)
  end

  def test_amount_in_till()
    assert_equal(100.00, @pub.till)
  end

  def test_get_drinks_level
    assert_equal(3, @pub.pub_drink_count)
  end

  def test_get_food_levels
    assert_equal(3, @pub.pub_food_count)
  end

  def test_increase_money_in_till_when_drink_bought()
    @pub.sell_drink(@drink1)
    assert_equal(104, @pub.till)
  end

  def test_increase_money_in_till_when_food_bought()
    @pub.sell_food(@food3)
    assert_equal(110.00, @pub.till)
  end

  def test_that_drink_level_reduces_when_sold
    @pub.sell_drink(@drink1)
    assert_equal(2, @pub.pub_drink_count)
  end

  def test_that_food_level_reduces_when_sold
    @pub.sell_food(@food1)
    assert_equal(2, @pub.pub_food_count)
  end

  def test_drink_transaction()
    @pub.sell_drink_to_customer(@customer1, @drink1)
    assert_equal(21.00, @customer1.wallet)
    assert_equal(104.00, @pub.till)
    assert_equal(2, @pub.pub_drink_count)
  end

  def test_food_transaction()
    @pub.sell_food_to_customer(@customer1, @food3)
    assert_equal(15.00, @customer1.wallet)
    assert_equal(110.00, @pub.till)
    assert_equal(2, @pub.pub_food_count)
  end

  def test_customer_age()
    @pub.sell_drink_to_customer(@customer1, @drink1)
    assert_equal(36, @customer1.age_check)
  end

  def test_customer_age__underage()
    assert_equal("Sorry, we cannot serve you!", @pub.sell_drink_to_customer(@customer2, @drink1))
  end

  def test_check_drunkenness_level__too_high()
    assert_equal("Sorry, we cannot serve you!", @pub.sell_drink_to_customer(@customer3, @drink1))
  end

end
