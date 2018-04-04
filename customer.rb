class Customer

  attr_reader :name, :wallet, :age, :drunkenness_level

  def initialize(name, wallet, age, drunkenness_level)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness_level = drunkenness_level
  end

  def buy_drink(drink)
    @wallet -= drink.price
    @drunkenness_level += drink.alcohol_level
  end

  def buy_food(food)
    @wallet -= food.price
    @drunkenness_level += food.rejuvenation_level
  end

  def age_check()
    return @age
  end

end
