class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table(:recipes, {id: false}) do |t|
      t.integer :id
      t.string :title
      t.string :description
      t.string :photo
      t.string :chef_name
      t.string :tags

      t.timestamps
    end
  end
end
