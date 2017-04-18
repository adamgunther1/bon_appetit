require_relative 'recipe'
require 'pry'
class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
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

end
