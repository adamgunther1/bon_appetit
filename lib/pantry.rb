require_relative 'recipe'

class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
    @additions = 0
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
      addition_to_list = recipe.ingredients
      if @additions == 0
        @additions +=1
        return @shopping_list = addition_to_list
      else
        return @shopping_list.merge!(addition_to_list){|key, oldval, newval| newval + oldval}
      end
  end

end
