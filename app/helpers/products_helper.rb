module ProductsHelper
  def hasAdded?(user, product)
    Order.prod_len(user, product) === 0 ? false : true
  end
end
