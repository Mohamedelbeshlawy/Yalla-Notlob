class OrdersController < ApplicationController
    def index
        @orders = Order.where(user_id: current_user.id)
    end
    
    def new
        @order = Order.new
    end

    def create
        @order_params = params.require(:newOrder).permit(:meal_type, :restaurant_name, :restaurant_menu)
        @order = Order.new(@order_params)
        @order.order_status = "Waiting"
        @order.user_id = current_user.id
        if (@order.save)
            @orders = Order.where(user_id: current_user.id)
            render 'index'
        else
            render 'new'
        end
    end

    def cancel
        @order_id = params[:id]
        @order = Order.find(id = @order_id)
        @order.status = "Cancelled"
        @order.save
        redirect_to orders_path
    end

    def finish
        @order_id = params[:id]
        @order = Order.find(id = @order_id)
        @order.status = "Finished"
        @order.save
        redirect_to orders_path
    end
end
