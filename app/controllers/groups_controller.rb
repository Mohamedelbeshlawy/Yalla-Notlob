class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(creator: current_user.id)
  end
  def show
    @groups = Group.where(creator: current_user.id)
    @group = Group.find_by(id: params[:id], creator: current_user.id)
    if @group.nil?
      flash[:group_error] = "This id is not matching with any Friends "
      redirect_to :groups
    else
      @group_members = @group.users.all
    end
    
  end

  def create
    @group = Group.new
    @group.creator = current_user.id
    @group.name = params[:name]
    @group.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @group = Group.find params[:id]
    if @group.destroy
      flash[:delete_notice] = "You have successfully deleted your group"
      redirect_to groups_path
    end
  end
end
