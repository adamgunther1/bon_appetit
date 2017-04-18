require_relative 'recipe'

class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
  end

  def stock_check(item)
    if stock[item].nil?
      return 0
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
    @shopping_list = recipe.ingredients
  end


end
