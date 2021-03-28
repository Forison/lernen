class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :details

      t.timestamps
    end
  end
end
