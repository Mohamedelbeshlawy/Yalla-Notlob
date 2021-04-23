class ItemsController < ApplicationController
    def index
        @order = Order.where(id: params[:id]).first
        @items = Item.where(order: params[:id])
    end
    
    def new
        @order = Order.where(id: params[:id]).first
        @item = Item.new
    end

    def create
        @item_params = params.require(:newItem).permit(:name, :amount, :price, :comment, :user_id)
        @item = Item.new(@item_params)
        @item.order_id = params[:id]
        @item.user_id = current_user.id
        if (@item.save)
            @order = Order.where(id: params[:id]).first
            @items = Item.where(order: params[:id])
            render 'index'
        else
            render 'new'
        end
    end

    def delete
        @item = Item.find(params[:item_id])
        @item.delete if current_user.id == @item.user_id
        @order = Order.where(id: params[:id]).first
        @items = Item.where(order: params[:id])
        redirect_to order_path(@order)
    end
end
