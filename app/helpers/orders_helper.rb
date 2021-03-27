module OrdersHelper
  def sum_total()
    products_id = Order.where(user_id: @current_user.id).pluck('product_id')
    find_prod = Product.find(products_id)
    price_list = Product.find(products_id).pluck('price')
    {:sum => price_list.map{|a| a.to_i}.reduce(:+), :product=> products_id}
  end
end
