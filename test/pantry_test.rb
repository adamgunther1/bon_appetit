require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @p = Pantry.new
    @r = Recipe.new("Cheese Pizza")
  end
  
  def test_pantry_exists
    
    assert_instance_of Pantry, @p
  end

  def test_empty_pantry_when_initialized
    stock = {}
    assert_equal stock, @p.stock
  end

  def test_checking_stock_method_before_restocking
    assert_equal 0, @p.stock_check("Cheese")
  end
  
  def test_restocking
    @p.restock("Cheese", 10)
    assert_equal 10, @p.stock_check("Cheese")
    @p.restock("Cheese", 20)
    assert_equal 30, @p.stock_check("Cheese")
  end

  def test_new_recipe_feature_for_pantry
    ingredient_list = {}
    assert_equal ingredient_list, @r.ingredients
    @r.add_ingredient("Cheese", 20)
    @r.add_ingredient("Flour", 20)
    ingredient_list = {"Cheese" => 20, "Flour" => 20}
    assert_equal ingredient_list, @r.ingredients
  end

  def test_adding_the_recipe_to_the_shopping_list
    @r.add_ingredient("Cheese", 20)
    @r.add_ingredient("Flour", 20)
    ingredient_list = {"Cheese" => 20, "Flour" => 20}
    addition_to_list = @p.add_to_shopping_list(@r)
    assert_equal ingredient_list, addition_to_list
    assert_equal  @p.shopping_list, addition_to_list
  end

  def test_adding_another_recipe_to_shopping_list
    @r.add_ingredient("Cheese", 20)
    @r.add_ingredient("Flour", 20)
    @p.add_to_shopping_list(@r)
    @r_1 = Recipe.new("Spaghetti")
    @r_1.add_ingredient("Noodles", 10)
    @r_1.add_ingredient("Sauce", 10)
    @r_1.add_ingredient("Cheese", 5)
    @p.add_to_shopping_list(@r_1)
    spaghetti_ingredients = @r_1.ingredients
    spaghetti_ingredients_list = {"Noodles" => 10, "Sauce" => 10, "Cheese" => 5}
    assert_equal spaghetti_ingredients_list, spaghetti_ingredients
    shopping_list = {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}
    assert_equal shopping_list, @p.shopping_list
  end





end
