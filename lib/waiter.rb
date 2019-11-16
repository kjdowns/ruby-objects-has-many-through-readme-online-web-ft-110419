
class Waiter
  
  attr_accessor :name, :years_experience
  
  @@all = []
  
  def initialize(name, experience)
    @name = name
    @years_experience = experience
    @@all << self
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def best_tipper
    tips = self.meals.map {|meal| meal.tip}
    max_tip = tip.max
    self.meals.find {|meal| meal.tip == max_tip}
  end
  
  def self.all 
    @@all 
  end
  
end