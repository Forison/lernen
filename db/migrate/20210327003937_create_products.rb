class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :price
      t.boolean :disabled, default: true

      t.timestamps
    end
  end
end
