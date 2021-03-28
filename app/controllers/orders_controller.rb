class OrdersController < ApplicationController
  before_action :set_orders, only: [:create, :index, :destroy, :show, :checkout]
  def index
    products = Order.product_from_order(@current_user)
    @orders = Product.find(products)
  end
  
  def show
    @order = Order.find(1)
  end
  
  def checkout 
    check = @current_user.checkouts.build({
      details: {
        :street => params[:street], 
        :zipcode => params[:zipcode], 
        :country => params[:country], 
        :name => params[:name], 
        :email =>params[:email], 
        :account =>params[:account], 
        :bank =>params[:bank],
        :total => params[:sum],
        :items => params[:purchase]
      }
    })
    if check.save 
      respond_to do |format|
        format.html { redirect_back fallback_location: checkout_path, notice: "orders was successfully destroyed." }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: checkout_path, notice: "orders was successfully destroyed." }
      end
    end
  end
  
  def new
    @orders = Order.new
  end
  
  def create
    @orders = Order.create({user_id: @current_user.id, product_id: params[:product_id]})
    if @orders.visible
      respond_to do |format|
        format.html { redirect_to fallback_location: orders_url, notice: "New order was successfully added." }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: orders_url, notice: "Order was successfully destroyed." }
      end
    end
  end

  def destroy
    @order = Order.find_by(user_id: @current_user.id , product_id: params[:id])
    @order.update_columns(visible: false)
    if !@order.visible
      respond_to do |format|
        format.html { redirect_to orders_url, notice: "orders was successfully destroyed." }
      end
    else
      respond_to do |format|
        format.html { redirect_to orders_url, notice: "orders couldd not be destroyed try again" }
      end
    end
  end

  private
    def set_orders
      @current_user = cookies[:auth_user] ? User.find(cookies[:auth_user]) : create_user_login
    end
    
    def create_user_login
      user = User.create
      cookies[:auth_user] = user.id
      user
    end
end
