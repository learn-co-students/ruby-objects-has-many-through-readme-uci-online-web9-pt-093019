require 'pry'

class Customer

  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name, @age = name, age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select{|meal_instance| meal_instance.customer.name == self.name}
  end

  def waiters #>> I tried using a second select method, but won't work.  Not sure why not?
    final_array = []
    Meal.all.select{|meal_instance| meal_instance.customer.name == self.name}.each do |meal|
      final_array << meal.waiter
    end
    final_array
  end

end
