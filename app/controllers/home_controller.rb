class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
      orders = Order.where(user_id: current_user.id)
      invites = Invite.where(user_id: current_user.id)
      @orders_from_invitations = []
      invites.each do |invite|
        @orders_from_invitations.append(Order.where(id: invite.order_id).first)
      end
  
      
      @orders_from_invitations = @orders_from_invitations[0..4]
    end
  
    def show
    end
  
end
