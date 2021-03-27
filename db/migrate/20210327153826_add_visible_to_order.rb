class AddVisibleToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :visible, :boolean, default: true
  end
end
