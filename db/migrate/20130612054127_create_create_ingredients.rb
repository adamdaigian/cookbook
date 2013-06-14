class CreateCreateIngredients < ActiveRecord::Migration
  def change
    create_table :create_ingredients do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
