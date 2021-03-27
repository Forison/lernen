module OrdersHelper
  def sum_total()
    price_list = []
    products_id = @current_user.orders
    products_id.each do |val|
      price_list << Product.find(val.product_id).price
    end
    price_list.map{|val| val.to_i}.reduce(:+)
  end

  def my_selections(arg)
    @current_user.orders.where(product_id: arg, visible: true).size
  end
end
