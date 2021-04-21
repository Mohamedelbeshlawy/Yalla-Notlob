class OrdersController < ApplicationController
    def index
        @orders = Order.where(user_id: current_user.id, order_status: 0)
    end
    
    def new
        @order = Order.new
    end

    def create
        @order_params = params.require(:newOrder).permit(:meal_type, :restaurant_name, :restaurant_menu)
        @order = Order.new(@order_params)
        @order.order_status = 0
        @order.user_id = current_user.id
        if (@order.save)
            @orders = Order.where(user_id: current_user.id, order_status: 0)
            render 'index'
        else
            render 'new'
        end
    end

    def cancel
        @order_id = params[:id]
        @order = Order.find(id = @order_id)
        @order.order_status = 2
        @order.save
        redirect_to orders_path
    end

    def finish
        @order_id = params[:id]
        @order = Order.find(id = @order_id)
        @order.order_status = 1
        @order.save
        redirect_to orders_path
    end
end
