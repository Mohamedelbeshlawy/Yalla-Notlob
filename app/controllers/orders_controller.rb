class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id, order_status: 0)
    @invites = Invitation.where(user_id: current_user.id)
    @orders_from_invitations = []
    @invites.each do |invite|
      order = Order.find_by(id: invite.order_id, order_status: 0)
      if order
        @orders_from_invitations.append(order)
      end
    end

    @orders.each do |order|
      @orders_from_invitations.append(order)
    end
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.where(id: params[:id]).first
    @items = Item.where(order: params[:id])
  end

  def create
    @order_params = params.require(:newOrder).permit(:meal_type, :restaurant_name, :restaurant_menu)
    @order = Order.new(@order_params)
    @order.order_status = 0
    @order.user_id = current_user.id
    if @order.save
      @invites = Invitation.where(user_id: current_user.id)
      @orders = Order.where(user_id: current_user.id, order_status: 0)
      render 'index'
    else
      render 'new'
    end
  end

  def cancel
    @order_id = params[:id]
    @order = Order.find(id = @order_id)
    if @order.user_id == current_user.id
      @order.order_status = 2
      @order.save
      redirect_to orders_path
    else
      redirect_to orders_path
    end
  end

  def finish
    @order_id = params[:id]
    @order = Order.find(id = @order_id)
    if @order.user_id == current_user.id
      @order.order_status = 1
      @order.save
      redirect_to orders_path
    else
      redirect_to orders_path
    end
  end

  def inviteFriends
    @friends_arr = []
    current_user.friendships.each do |friendship|
      @friendsToInvite = @friends_arr.push(User.find(id = friendship.friend_id))
    end

    @groups = Group.where(creator: current_user.id)
    @invited_arr = []
    @order = Order.find(id = params['id'])
    @invite = Invitation.where(order_id: @order.id)
    @invite.each do |invitation|
      @invitedFriends = @invited_arr.push(User.find(id = invitation.user_id))
    end

    @joined_arr = []
    @joined = Invitation.where(order_id: @order.id, joined: true)
    @joined.each do |invitation|
      @joinedFriends = @joined_arr.push(User.find(id = invitation.user_id))
    end
  end

  def cancelInvitation
    @cancel_id = params["cancel-btn"]
    @order = Order.find(id = params['id'])
    @invite = Invitation.where(order_id: @order.id)
    p 'cancel id ====', @cancel_id
    if not @cancel_id.nil?
      p params
      @deleted_invitation = @invite.where(user_id: @cancel_id)
      @deleted_invitation.delete_all
    end
    redirect_to inviteFriends_path
  end

  def invite
    @friend_id = params['invite-btn']
    @friend = User.find(id = @friend_id)
    @order = Order.find(id = params['id'])

    if Invitation.where(user_id: @friend.id, order_id: @order.id).present?
      flash[:danger] = "#{@friend.first_name} is already invited"
      redirect_to inviteFriends_path
    elsif @new_invite = Invitation.new()
      @new_invite.user = @friend
      @new_invite.order = @order
      @new_invite.save
      redirect_to inviteFriends_path
    end
  end

  def inviteGroup
    @group_id = params["inviteGroup-btn"]
    @order = Order.find(id = params['id'])
    @groupToInvite = Group.find_by(id: @group_id)
    @groupToInvite_members = @groupToInvite.users.all

    @groupToInvite_members.each do |user|
      if Invitation.where(user_id: user.id, order_id: @order.id).present?
        flash[:danger] = "#{user.first_name} is already invited"
      elsif @new_invite = Invitation.new()
        @new_invite.user = user
        @new_invite.order = @order
        @new_invite.save
      end
    end
    redirect_to inviteFriends_path
  end
end
