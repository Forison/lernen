class OrdersController < ApplicationController
  before_action :set_orders, only: [:create, :index]
  def index
    products = Order.where(user_id: @current_user.id).pluck('product_id')
    @orders = Product.find(products)
  end
  
  def show
  end

  def new
    @orders = Order.new
  end
  
  def create_user
  end
  
  def create
    # check if users token exist  if it exist create order else create user then create order.
    @orders = Order.create({user_id: @current_user.id, product_id: params[:product_id]})
    redirect_back fallback_location: products_path
  end

  def destroy
    @orders.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "orders was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_orders
      @current_user = cookies[:auth_user] ? User.find(cookies[:auth_user]) : create_user_login
    end
    
    def create_user_login
      user = User.create
      cookies[:auth_user] = user.id
    end

    def orders_params
      params.require(:orderst).permit(:product_id)
    end
end
