require_relative 'recipe'
class Pantry

  attr_reader :stock, :shopping_list, :cookbook

  def initialize
    @stock = {}
    @shopping_list = {}
    @cookbook = {}
  end

  def stock_check(item)
    if stock[item].nil?
      0
    else
      stock[item]
    end
  end

  def restock(item, quantity)
    if stock[item].nil?
      stock[item] = quantity
    else
      exisiting_quantity = stock[item]
      stock[item] = exisiting_quantity + quantity
    end
  end

  def add_to_shopping_list(recipe)
    if shopping_list.empty?
      @shopping_list = recipe.ingredients
    else
      @shopping_list.merge!(recipe.ingredients){|key, oldval, newval| newval + oldval}
    end
  end

  def print_shopping_list
    output = ""
    shopping_list.each do |key, value|
      output << "* #{key}: #{value}\n"
    end
    p output
  end

  def add_to_cookbook(recipe)
      @cookbook[recipe.name] = recipe.ingredients
  end

  def what_can_i_make
    what_i_can_make = []
    if stock["Cheese"] >= 20 && stock["Flour"] >= 20
      what_i_can_make << "Cheese Pizza"
    end
    if stock["Brine"] >= 10 && stock["Cucumbers"] >= 30
      what_i_can_make << "Pickles"
    end
    if stock["Raw nuts"] >= 10 && stock["Salt"] >= 10
      what_i_can_make << "Peanuts"
    end
    what_i_can_make
  end

end
