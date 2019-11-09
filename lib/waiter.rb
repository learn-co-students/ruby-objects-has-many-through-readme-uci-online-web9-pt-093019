class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, exp)
    @name = name
    @yrs_experience = exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max do |a, b|
      a.tip <=> b.tip
    end
    best_tipped_meal.customer
  end
end
