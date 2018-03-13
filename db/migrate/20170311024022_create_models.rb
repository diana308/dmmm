class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|
      t.string :input
      t.text :address
      t.string :color
      t.boolean :ketchup
      t.boolean :mustard
      t.boolean :mayonnaise
      t.date :start
      t.time :alarm

      t.timestamps
    end
  end
end
