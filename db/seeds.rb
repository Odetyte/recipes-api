# create database with the recipes
recipes = ApiCommunicator.new
recipes.get_recipes
puts "all Recipes successfully pulled"