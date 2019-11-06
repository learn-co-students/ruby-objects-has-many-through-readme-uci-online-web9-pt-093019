class Waiter

  attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name, @years_of_experience = name, years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meal_instance| meal_instance.waiter.name == self.name}
  end

  def best_tipper
    result = Meal.all.max{|meal_instance_a, meal_instance_b| meal_instance_a.tip <=> meal_instance_b.tip}
    result.customer
  end
end
