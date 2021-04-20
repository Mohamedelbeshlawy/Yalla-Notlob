class ItemsController < ApplicationController
    def index
        @order = Order.where(id: params[:id]).first
        @items = Item.where(order: params[:id])
    end
    
    def new
        @item_params = params.require(:addItem).permit(:person, :name, :amount, :price, :comment, :order)
        @item = Item.new(item_params)
        @item.order = params[:id]
        if (@item.save)
          @items = Item.where(order: params[:id])
          render 'index'
        else
          @items = Item.where(order: params[:id])
          render 'index'
        end
    end
end
