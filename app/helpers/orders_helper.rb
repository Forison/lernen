module OrdersHelper
  def sum_total
    price_list = []
    purchase=[]
    products_id = @current_user.orders
    products_id.each do |val|
      price_list << Product.find(val.product_id).price
      purchase << val.product_id
    end
    return {sum: price_list.map{|val| val.to_i}.reduce(:+), purchase: purchase}
  end

  def my_selections(arg)
    @current_user.orders.where(product_id: arg, visible: true).size
  end

end
