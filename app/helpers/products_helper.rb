module ProductsHelper
  def hasAdded?(user, product)
    Order.where(user_id: user, product_id: product).length === 0 ? false : true
  end
end
