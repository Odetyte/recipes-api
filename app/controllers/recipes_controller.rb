class RecipesController < ApplicationController
    def home
        # read all Recipes and store them in an instance variable
        # @recipes, which will be accessible in the associated view
        @recipes = Recipe.all     
    end

    def show
        # Get one Recipe by id
        @recipe = Recipe.find(params[:id])
    end

end
