class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :product_from_order, ->(me) { where(user_id: me.id, visible: true).pluck('product_id') }
  scope :prod_len, ->(user, product){where(user_id: user, product_id: product).length}
end
