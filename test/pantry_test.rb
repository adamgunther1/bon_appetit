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

  def test_printing_shopping_list
    @r.add_ingredient("Cheese", 25)
    @r.add_ingredient("Flour", 20)
    @r.add_ingredient("Spaghetti Noodles", 10)
    @r.add_ingredient("Marinara Sauce", 10)
    @p.add_to_shopping_list(@r)
    expected_output = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10\n"
    actual_output = @p.print_shopping_list
    assert_equal expected_output, actual_output
  end

  def test_adding_recipe_to_cookbook
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    @p.add_to_cookbook(r1)
    @p.add_to_cookbook(r2)
    @p.add_to_cookbook(r3)
    cookbook = {"Cheese Pizza" => {"Cheese" => 20, "Flour" => 20}, "Pickles" => {"Brine" => 10, "Cucumbers" => 30}, "Peanuts" => {"Raw nuts" => 10, "Salt" => 10}}
    assert_equal cookbook, @p.cookbook
  end

  def test_what_can_I_make
    @p.restock("Cheese", 10)
    @p.restock("Flour", 20)
    @p.restock("Brine", 40)
    @p.restock("Cucumbers", 40)
    @p.restock("Raw nuts", 20)
    @p.restock("Salt", 20)
    assert_equal ["Pickles", "Peanuts"], @p.what_can_i_make
  end




end
