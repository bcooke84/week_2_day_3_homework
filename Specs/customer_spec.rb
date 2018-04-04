require("minitest/autorun")
require("minitest/rg")

require_relative("../customer.rb")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../food.rb")

class CustomerTest < MiniTest::Test
  def setup()
    @customer = Customer.new("Victor", 25, [], [], 36, 0)
    @customer1 = Customer.new("John", 10, [], [], 17, 0)
    @customer2 = Customer.new("Brian", 20, [], [], 33, 20)
    @drink1 = Drink.new("Beer", 4, 4)
    @drink2 = Drink.new("Wine", 5, 5)
    @drink3 = Drink.new("Cider", 3, 6)
    @drink = [@drink1, @drink2, @drink3]
    @food1 = Food.new("Crisps", 2, -2)
    @food2 = Food.new("Sandwich", 5, -5)
    @food3 = Food.new("Pizza", 10, -10)
    @food = [@food1, @food2, @food3]
    @pub = Pub.new("The Grumpy Git", 100, @drink, @food)
  end

  def test_get_customer_name()
    assert_equal("Victor", @customer.name)
  end

  def test_get_customer_money()
    assert_equal(25, @customer.wallet)
  end

  def test_get_customer_has_no_drinks()
    assert_equal([], @customer.drinks)
  end

  def test_get_customer_has_no_food()
    assert_equal([], @customer.food)
  end

  def test_customer_has_one_drink()
    @customer.buy_drink(@drink1)
    assert_equal(1, @customer.drink_count)
  end

  def test_customer_has_one_food_item()
    @customer.buy_food(@food1)
    assert_equal(1, @customer.food_count)
  end

  def test_customer_wallet_amount_has_reduced__drink
    @customer.buy_drink(@drink1)
    assert_equal(21, @customer.wallet)
  end

  def test_customer_wallet_amount_has_reduced__food
    @customer.buy_food(@food3)
    assert_equal(15, @customer.wallet)
  end

  def test_customer_drunkenness_level
    assert_equal(0, @customer.drunkenness_level)
  end

  def test_customer_drunkenness_level__after_drink
    @customer.buy_drink(@drink2)
    assert_equal(5, @customer.drunkenness_level)
  end

  def test_customer_drunkenness_level__after_2_drinks
    @customer.buy_drink(@drink2)
    @customer.buy_drink(@drink3)
    assert_equal(11, @customer.drunkenness_level)
  end

  def test_customer_drunkenness_level__after_food_item
    @customer2.buy_food(@food1)
    assert_equal(18, @customer2.drunkenness_level)
  end

  def test_customer_drunkenness_level__after_2_food_items
    @customer2.buy_food(@food2)
    @customer2.buy_food(@food3)
    assert_equal(5, @customer2.drunkenness_level)
  end

end
