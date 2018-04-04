class Customer
  attr_reader :name, :wallet, :drinks, :food, :age, :drunkenness_level

  def initialize(name, wallet, drinks, food, age, drunkenness_level)
    @name = name
    @wallet = wallet
    @drinks = drinks
    @food = food
    @age = age
    @drunkenness_level = drunkenness_level
  end

  def buy_drink(drink)
    @drinks.push(drink)
    @wallet -= drink.price
    @drunkenness_level += drink.alcohol_level
  end

  def buy_food(food)
    @food.push(food)
    @wallet -= food.price
    @drunkenness_level += food.rejuvenation_level
  end

  def drink_count()
    return @drinks.count()
  end

  def food_count()
    return @food.count()
  end

  def age_check()
    return @age
  end

end
