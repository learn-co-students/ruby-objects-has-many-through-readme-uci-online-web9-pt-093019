class Waiter

  attr_reader :name, :yrs_experience
  @@all = []


  def initialize(name, exp)
    @name = name
    @yrs_experience = exp
    @@all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def self.all
    @@all
  end


end #end of class
