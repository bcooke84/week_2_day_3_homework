class Pub

  attr_reader :name, :till, :drinks, :food

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def pub_drink_count()
    return @drinks.count()
  end

  def pub_food_count()
    return @food.count()
  end

  def sell_drink(drink)
    @drinks.include?(drink)
    @till += drink.price
    @drinks.delete(drink)
  end

  def sell_food(food)
    @food.include?(food)
    @till += food.price
    @food.delete(food)
  end

  def sell_drink_to_customer(customer, drink)
    if customer.age_check >= 18 && customer.drunkenness_level <30
      sell_drink(drink)
      customer.buy_drink(drink)
    else return "Sorry, we cannot serve you!"
    end
  end

  def sell_food_to_customer(customer, food)
    if customer.age_check >= 18 && customer.drunkenness_level <30
      sell_food(food)
      customer.buy_food(food)
    else return "Sorry, we cannot serve you!"
    end
  end

end
